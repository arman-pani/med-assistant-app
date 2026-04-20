import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/services/model_manager.dart';
import 'features/settings/providers/model_catalog_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ModelManager.initLogging();
  await Hive.initFlutter();
  await Hive.openBox('model_state');
  runApp(const ProviderScope(child: MedGemmaApp()));
}

class MedGemmaApp extends ConsumerWidget {
  const MedGemmaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(modelCatalogProvider);

    return MaterialApp.router(
      title: 'MedGemma',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
