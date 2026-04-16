import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../providers/model_catalog_provider.dart';
import '../models/model_catalog_state.dart';
import '../../../core/models/recommended_model.dart';
import '../../../core/services/model_download_service.dart';
import '../widgets/available_model_card.dart';
import '../widgets/local_model_card.dart';
import '../../chat/screens/chat_screen.dart';

class ModelSetupScreen extends ConsumerStatefulWidget {
  const ModelSetupScreen({super.key});

  @override
  ConsumerState<ModelSetupScreen> createState() => _ModelSetupScreenState();
}

class _ModelSetupScreenState extends ConsumerState<ModelSetupScreen> {
  final TextEditingController _pathController = TextEditingController();

  @override
  void dispose() {
    _pathController.dispose();
    super.dispose();
  }

  void _addCustomPath(ModelCatalogNotifier notifier) {
    final path = _pathController.text.trim();
    if (path.isNotEmpty) {
      notifier.addCustomModel(path);
      _pathController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final catalogState = ref.watch(modelCatalogProvider);
    final catalogNotifier = ref.read(modelCatalogProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    // Listen for navigation to chat when a model finishes loading
    ref.listen<ModelCatalogState>(modelCatalogProvider, (prev, next) {
      if (next.loadedModelPath != null &&
          (prev?.loadedModelPath == null || prev?.isLoadingModel == true) &&
          !next.isLoadingModel) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ChatScreen()),
        );
      }
    });

    final downloadedCatalogIds = catalogState.localModels
        .map((m) => m.catalogId)
        .whereType<String>()
        .toSet();

    final notDownloaded = RecommendedModel.catalog
        .where((m) => !downloadedCatalogIds.contains(m.id))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        title: const Text('Models'),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (catalogState.errorMessage != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          catalogState.errorMessage!,
                          style: TextStyle(color: colorScheme.onErrorContainer),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: colorScheme.onErrorContainer,
                        ),
                        onPressed: catalogNotifier.dismissError,
                      ),
                    ],
                  ),
                ),

              // My Models Section
              const Text('MY MODELS', style: AppTextStyles.labelLarge),
              const SizedBox(height: 8),
              if (catalogState.localModels.isEmpty)
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.divider,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'No models downloaded yet',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                )
              else
                ...catalogState.localModels.map(
                  (entry) => LocalModelCard(entry: entry),
                ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(height: 1),
              ),

              // Available Models Section
              const Text('AVAILABLE MODELS', style: AppTextStyles.labelLarge),
              const SizedBox(height: 8),
              if (notDownloaded.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'All recommended models are already downloaded.',
                      style: AppTextStyles.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              else
                ...notDownloaded.map(
                  (model) => AvailableModelCard(model: model),
                ),

              const SizedBox(height: 24),
              ExpansionTile(
                leading: const Icon(Icons.folder_open_outlined),
                title: const Text(
                  'Add from local path',
                  style: AppTextStyles.bodyLarge,
                ),
                tilePadding: EdgeInsets.zero,
                children: [
                  TextField(
                    controller: _pathController,
                    style: AppTextStyles.bodyLarge,
                    decoration: InputDecoration(
                      hintText: '/storage/emulated/0/Download/model.gguf',
                      labelText: 'Full path to .gguf file',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => _addCustomPath(catalogNotifier),
                      ),
                    ),
                    onSubmitted: (_) => _addCustomPath(catalogNotifier),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'The file must be a .gguf model already present on your device.',
                    style: AppTextStyles.labelSmall,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
