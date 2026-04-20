import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/chat_provider.dart';
import '../widgets/chat_input_area.dart';
import '../widgets/chat_message_list.dart';
import '../../settings/providers/model_catalog_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cursorController.dispose();
    super.dispose();
  }

  void _showDisclaimer(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Disclaimer'),
        content: const Text(
          'This app provides general health information only. Always consult a '
          'qualified healthcare professional for medical advice.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('OK')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);
    final catalogState = ref.watch(modelCatalogProvider);
    final isInitializing =
        catalogState.isBootstrapping ||
        catalogState.isLoadingModel ||
        chatState.isModelLoading ||
        chatState.isProjectorLoading;

    ref.listen<ChatState>(chatProvider, (prev, next) {
      if (prev != null && next.messages.length != prev.messages.length) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.primaryYellow,
        elevation: 0,
        title: Row(
          children: [
            const Text('MedGemma', style: AppTextStyles.headlineMedium),
            const SizedBox(width: 8),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: chatState.isModelLoaded && !isInitializing
                    ? AppColors.success
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.medical_services_outlined),
            onPressed: () => context.push(AppRoutes.clinicalVoice),
            tooltip: 'Clinical Voice Mode',
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(AppRoutes.modelSetup),
            tooltip: 'Model Setup',
          ),
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () => chatNotifier.clearConversation(),
            tooltip: 'Clear Conversation',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showDisclaimer(context),
            tooltip: 'Info',
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              const Divider(height: 1, thickness: 0.5),
              if (chatState.errorMessage != null && !isInitializing)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.error.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.error),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          chatState.errorMessage!,
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                      IconButton(
                        onPressed: chatNotifier.dismissError,
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.textSecondary,
                        ),
                        tooltip: 'Dismiss error',
                      ),
                    ],
                  ),
                ),
              if (isInitializing)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 48,
                          height: 48,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryYellow,
                            strokeWidth: 3,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'MedGemma is initializing...',
                          style: AppTextStyles.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chatState.isProjectorLoading
                              ? 'Loading the selected model and vision projector'
                              : 'Setting up the locally loaded model',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else if (!chatState.isModelLoaded)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.smart_toy_outlined,
                          size: 64,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No model is currently loaded.',
                          style: AppTextStyles.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please load a model to start a consultation.',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        FilledButton.icon(
                          onPressed: () => context.push(AppRoutes.modelSetup),
                          icon: const Icon(Icons.settings),
                          label: const Text('Go to Model Setup'),
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primaryYellow,
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else ...[
                Expanded(
                  child: ChatMessageList(
                    chatState: chatState,
                    scrollController: _scrollController,
                    cursorAnimation: _cursorController,
                  ),
                ),
                const ChatInputArea(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
