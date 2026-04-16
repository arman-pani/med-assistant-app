import 'package:flutter/material.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/chat_provider.dart';
import 'chat_message_bubble.dart';

class ChatMessageList extends StatelessWidget {
  final ChatState chatState;
  final ScrollController scrollController;
  final Animation<double> cursorAnimation;

  const ChatMessageList({
    super.key,
    required this.chatState,
    required this.scrollController,
    required this.cursorAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (chatState.messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.medical_services_outlined,
              size: 64,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingLg,
              ),
              child: Text(
                'Ask me anything about symptoms, medications, or general health topics.',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: chatState.messages.length,
      itemBuilder: (context, index) {
        return ChatMessageBubble(
          message: chatState.messages[index],
          cursorAnimation: cursorAnimation,
        );
      },
    );
  }
}
