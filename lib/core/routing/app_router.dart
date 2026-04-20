import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/chat/screens/chat_screen.dart';
import '../../features/voice/screens/clinical_voice_screen.dart';
import '../../features/settings/screens/model_setup_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.chat,
    routes: [
      GoRoute(
        path: AppRoutes.chat,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: AppRoutes.modelSetup,
        builder: (context, state) => const ModelSetupScreen(),
      ),
      GoRoute(
        path: AppRoutes.clinicalVoice,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: ClinicalVoiceScreen(),
        ),
      ),
    ],
  );
}
