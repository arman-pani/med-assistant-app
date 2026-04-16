import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/services/model_download_service.dart';
import '../providers/download_provider.dart';

class AvailableModelCard extends ConsumerStatefulWidget {
  final RecommendedModel model;
  const AvailableModelCard({super.key, required this.model});

  @override
  ConsumerState<AvailableModelCard> createState() => _AvailableModelCardState();
}

class _AvailableModelCardState extends ConsumerState<AvailableModelCard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(downloadProvider(widget.model.id).notifier)
          .checkIfDownloaded(widget.model),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dl = ref.watch(downloadProvider(widget.model.id));
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(downloadProvider(widget.model.id), (prev, next) {
      if (next.error != null && prev?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: AppColors.error,
          ),
        );
        ref.read(downloadProvider(widget.model.id).notifier).clearError();
      }
    });

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(AppDimensions.paddingMd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.model.displayName,
                  style: AppTextStyles.titleSmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.backgroundElevated,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(widget.model.badge, style: AppTextStyles.badgeText),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            widget.model.description,
            style: AppTextStyles.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.storage,
                size: 14,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                widget.model.fileSizeLabel,
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.memory,
                size: 14,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                widget.model.ramRequirement,
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
              ),
            ],
          ),
          if (dl.isDownloading) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: dl.progress,
                minHeight: 6,
                backgroundColor: AppColors.backgroundElevated,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dl.progressLabel, style: AppTextStyles.mono),
                Text(dl.remainingLabel, style: AppTextStyles.labelSmall),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => ref
                    .read(downloadProvider(widget.model.id).notifier)
                    .cancelDownload(widget.model),
                icon: const Icon(Icons.cancel_outlined, size: 16),
                label: const Text('Cancel'),
              ),
            ),
          ] else if (dl.isDownloaded)
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Downloaded ✓',
                  style: TextStyle(color: AppColors.success, fontSize: 13),
                ),
              ),
            )
          else ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => ref
                    .read(downloadProvider(widget.model.id).notifier)
                    .startDownload(widget.model),
                icon: const Icon(Icons.download_rounded, size: 18),
                label: Text('Download ${widget.model.fileSizeLabel}'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
