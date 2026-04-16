// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_catalog_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModelCatalogNotifier)
final modelCatalogProvider = ModelCatalogNotifierProvider._();

final class ModelCatalogNotifierProvider
    extends $NotifierProvider<ModelCatalogNotifier, ModelCatalogState> {
  ModelCatalogNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelCatalogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelCatalogNotifierHash();

  @$internal
  @override
  ModelCatalogNotifier create() => ModelCatalogNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModelCatalogState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModelCatalogState>(value),
    );
  }
}

String _$modelCatalogNotifierHash() =>
    r'c2d6a72403564f03232b41d6a3f6d1aec492d612';

abstract class _$ModelCatalogNotifier extends $Notifier<ModelCatalogState> {
  ModelCatalogState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ModelCatalogState, ModelCatalogState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModelCatalogState, ModelCatalogState>,
              ModelCatalogState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
