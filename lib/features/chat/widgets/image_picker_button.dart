import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medgemma_local/core/theme/app_colors.dart';
import 'package:medgemma_local/core/theme/app_text_styles.dart';
import 'package:medgemma_local/features/chat/providers/chat_provider.dart';

class ImagePickerButton extends ConsumerStatefulWidget {
  const ImagePickerButton({super.key});

  @override
  ConsumerState<ImagePickerButton> createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends ConsumerState<ImagePickerButton> {
  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final isGenerating = chatState.isGenerating;
    final visionSupported = chatState.visionSupported;
    final isBusy = chatState.isModelLoading || chatState.isProjectorLoading;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: const BoxDecoration(
        color: AppColors.backgroundInput,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          Icons.add_photo_alternate_outlined,
          color: visionSupported
              ? AppColors.primaryYellow
              : AppColors.textSecondary.withValues(alpha: 0.35),
        ),
        tooltip: visionSupported
            ? 'Attach image'
            : 'Load a vision projector (mmproj) to enable image input',
        onPressed: (isGenerating || isBusy || !visionSupported)
            ? null
            : () => _handlePressed(context),
      ),
    );
  }

  Future<void> _handlePressed(BuildContext context) async {
    final source = await _showPickerSheet(context);
    if (source == null || !mounted) return;

    await Future<void>.delayed(const Duration(milliseconds: 150));
    if (!mounted) return;

    await _pickImage(source);
  }

  Future<ImageSource?> _showPickerSheet(BuildContext context) {
    return showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: AppColors.backgroundDark,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.camera_alt_outlined,
                color: AppColors.textPrimary,
              ),
              title: const Text('Take a photo', style: AppTextStyles.bodyLarge),
              onTap: () => Navigator.of(sheetContext).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library_outlined,
                color: AppColors.textPrimary,
              ),
              title: const Text(
                'Choose from gallery',
                style: AppTextStyles.bodyLarge,
              ),
              onTap: () => Navigator.of(sheetContext).pop(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final file = await picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 70,
      );
      if (file == null) return;
      if (!mounted) return;

      ref.read(chatProvider.notifier).attachImage(file.path);
    } catch (e) {
      if (!mounted) return;
      ref
          .read(chatProvider.notifier)
          .setError('Could not attach image. Please try again.\n$e');
    }
  }
}

class PendingImagePreview extends ConsumerWidget {
  const PendingImagePreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(chatProvider.select((s) => s.pendingImagePath));
    if (imagePath == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(imagePath),
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 64,
                      height: 64,
                      color: AppColors.backgroundElevated,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: -6,
                right: -6,
                child: GestureDetector(
                  onTap: () =>
                      ref.read(chatProvider.notifier).clearAttachedImage(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundElevated,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.divider),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(
                      Icons.close,
                      size: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Image attached. Type your question or send as-is.',
              style: AppTextStyles.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
