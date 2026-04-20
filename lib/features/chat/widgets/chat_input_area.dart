import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medgemma_local/features/chat/widgets/image_picker_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/chat_provider.dart';
import '../../settings/providers/model_catalog_provider.dart';

class ChatInputArea extends ConsumerStatefulWidget {
  const ChatInputArea({super.key});

  @override
  ConsumerState<ChatInputArea> createState() => _ChatInputAreaState();
}

class _ChatInputAreaState extends ConsumerState<ChatInputArea> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage(ChatNotifier chatNotifier) {
    final text = _messageController.text.trim();
    final chatState = ref.read(chatProvider);
    if (text.isEmpty && chatState.pendingImagePath == null) return;

    _messageController.clear();
    setState(() {});
    chatNotifier.sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);
    final catalogState = ref.watch(modelCatalogProvider);

    final canSend =
        (_messageController.text.trim().isNotEmpty ||
            chatState.pendingImagePath != null) &&
        !chatState.isGenerating;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    String modelInfoText = '';
    if (catalogState.loadedModelPath != null) {
      final entry = catalogState.localModels
          .where((m) => m.path == catalogState.loadedModelPath)
          .firstOrNull;
      if (entry != null) {
        modelInfoText = entry.displayName;
        if (entry.fileSizeLabel != null) {
          modelInfoText += ' • ${entry.fileSizeLabel}';
        }
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 0.5),
        const PendingImagePreview(),
        if (modelInfoText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Text(
              modelInfoText,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.fromLTRB(4, 2, 8, 8 + bottomInset),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 4),

              const _VoiceModePlaceholder(),
              const SizedBox(width: 6),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  maxLines: 4,
                  minLines: 1,
                  style: AppTextStyles.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Ask a medical question...',
                    hintStyle: AppTextStyles.bodyMedium,
                    filled: true,
                    fillColor: AppColors.backgroundInput,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXl,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXl,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXl,
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.primaryYellow,
                        width: 1,
                      ),
                    ),
                  ),
                  enabled: !chatState.isGenerating,
                  onChanged: (_) => setState(() {}),
                  onSubmitted: (_) {
                    if (canSend) _sendMessage(chatNotifier);
                  },
                ),
              ),
              const SizedBox(width: 8),
              const ImagePickerButton(),
              const SizedBox(width: 8),
              if (chatState.isGenerating)
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundInput,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.stop_rounded,
                      color: AppColors.error,
                    ),
                    onPressed: () => chatNotifier.stopGeneration(),
                    tooltip: 'Stop',
                  ),
                )
              else
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundInput,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      color: canSend
                          ? AppColors.primaryYellow
                          : AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                    onPressed: canSend
                        ? () => _sendMessage(chatNotifier)
                        : null,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _VoiceModePlaceholder extends StatelessWidget {
  const _VoiceModePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Placeholder for VoiceModeButton
  }
}
