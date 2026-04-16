import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/chat_provider.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final Animation<double> cursorAnimation;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.cursorAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Align(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMd,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isUser ? AppColors.userBubble : AppColors.aiBubble,
                borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                border: isUser
                    ? Border.all(
                        color: AppColors.primaryYellow.withValues(alpha: 0.1),
                      )
                    : Border.all(color: AppColors.divider),
              ),
              child: isUser
                  ? SelectableText(
                      message.text,
                      style: AppTextStyles.chatUserText.copyWith(height: 1.4),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MarkdownBody(
                          data: message.text,
                          styleSheet: MarkdownStyleSheet(
                            p: AppTextStyles.chatAIText.copyWith(height: 1.4),
                            strong: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                            listBullet: AppTextStyles.chatAIText,
                            code: const TextStyle(
                              backgroundColor: AppColors.backgroundElevated,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                        if (message.isStreaming)
                          AnimatedBuilder(
                            animation: cursorAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: cursorAnimation.value,
                                child: const Text(
                                  '▊',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primaryYellow,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _formatTimestamp(message.timestamp),
            style: AppTextStyles.labelSmall,
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
