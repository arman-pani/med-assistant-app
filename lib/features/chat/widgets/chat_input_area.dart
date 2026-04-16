import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/chat_provider.dart';

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
    if (text.isEmpty) return;

    _messageController.clear();
    setState(() {});
    chatNotifier.sendMessage(text);
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);
    final canSend =
        _messageController.text.trim().isNotEmpty && !chatState.isGenerating;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundDark,
        border: Border(top: BorderSide(color: AppColors.divider, width: 0.5)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMd,
        vertical: AppDimensions.paddingMd,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
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
          if (chatState.isGenerating)
            IconButton(
              icon: const Icon(Icons.stop_rounded, color: AppColors.error),
              onPressed: () => chatNotifier.stopGeneration(),
              tooltip: 'Stop',
            )
          else
            IconButton(
              icon: Icon(
                Icons.send_rounded,
                color: canSend
                    ? AppColors.primaryYellow
                    : AppColors.backgroundElevated,
              ),
              onPressed: canSend ? () => _sendMessage(chatNotifier) : null,
            ),
        ],
      ),
    );
  }
}
