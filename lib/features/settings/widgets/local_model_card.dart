import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/model_catalog_provider.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/recommended_model.dart';
import '../providers/download_provider.dart';

class LocalModelCard extends ConsumerWidget {
  final LocalModelEntry entry;
  const LocalModelCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogState = ref.watch(modelCatalogProvider);
    final catalogNotifier = ref.read(modelCatalogProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    final isLoaded = catalogState.isLoaded(entry.path);
    final isLoadingThis = catalogState.loadingModelPath == entry.path;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLoaded
            ? colorScheme.primaryContainer.withValues(alpha: 0.15)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLoaded ? colorScheme.primary : AppColors.divider,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.displayName, style: AppTextStyles.titleSmall),

                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (entry.fileSizeLabel != null) ...[
                          const Icon(
                            Icons.storage,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            entry.fileSizeLabel!,
                            style: AppTextStyles.bodyMedium,
                          ),
                          const SizedBox(width: 12),
                        ],
                        if (entry.isCustom)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundElevated,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Custom',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 10,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isLoaded)
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.success,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Loaded',
                          style: TextStyle(
                            color: AppColors.success,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else if (isLoadingThis)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
          const SizedBox(height: 8),
          if (isLoaded)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () =>
                      _confirmDelete(context, catalogNotifier, entry),
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('Delete'),
                  style: TextButton.styleFrom(foregroundColor: AppColors.error),
                ),
              ],
            )
          else if (isLoadingThis)
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Loading into memory...',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.icon(
                  onPressed: () => catalogNotifier.loadModel(
                    path: entry.path,
                    displayName: entry.displayName,
                  ),
                  icon: const Icon(Icons.play_arrow_rounded, size: 18),
                  label: const Text('Load'),
                ),
                TextButton.icon(
                  onPressed: () =>
                      _confirmDelete(context, catalogNotifier, entry),
                  icon: const Icon(Icons.delete_outline, size: 16),
                  label: const Text('Delete'),
                  style: TextButton.styleFrom(foregroundColor: AppColors.error),
                ),
              ],
            ),
          
          if (!entry.isCustom && entry.catalogId != null)
            Builder(
              builder: (context) {
                final recommendedModel = RecommendedModel.catalog
                    .where((m) => m.id == entry.catalogId)
                    .firstOrNull;
                if (recommendedModel != null &&
                    recommendedModel.projectorFileName != null &&
                    !entry.hasProjector) {
                  return _LocalProjectorDownloadSection(model: recommendedModel);
                }
                return const SizedBox.shrink();
              },
            ),
        ],
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    ModelCatalogNotifier notifier,
    LocalModelEntry entry,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${entry.displayName}?'),
        content: const Text(
          'This will remove the file from your device. You can re-download it later.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              notifier.deleteModel(entry);
              context.pop();
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _LocalProjectorDownloadSection extends ConsumerWidget {
  final RecommendedModel model;
  const _LocalProjectorDownloadSection({required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dl = ref.watch(downloadProvider(model.id));
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.backgroundElevated.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    size: 14,
                    color: AppColors.primaryYellow,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Vision Projector (mmproj)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Required for image analysis. 624 MB.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              if (dl.isDownloadingProjector) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: dl.projectorProgress,
                    minHeight: 4,
                    backgroundColor: AppColors.backgroundDark,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dl.projectorProgressLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        fontFamily: 'monospace',
                      ),
                    ),
                    Text(
                      dl.projectorRemainingLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => ref
                        .read(downloadProvider(model.id).notifier)
                        .cancelDownload(model),
                    child: const Text('Cancel', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ] else
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => ref
                        .read(downloadProvider(model.id).notifier)
                        .startProjectorDownload(model),
                    icon: const Icon(Icons.download_rounded, size: 18),
                    label: const Text('Download Projector (624 MB)'),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
