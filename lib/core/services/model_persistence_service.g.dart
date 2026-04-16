// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_persistence_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(modelPersistenceService)
final modelPersistenceServiceProvider = ModelPersistenceServiceProvider._();

final class ModelPersistenceServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ModelPersistenceService>,
          ModelPersistenceService,
          FutureOr<ModelPersistenceService>
        >
    with
        $FutureModifier<ModelPersistenceService>,
        $FutureProvider<ModelPersistenceService> {
  ModelPersistenceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelPersistenceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelPersistenceServiceHash();

  @$internal
  @override
  $FutureProviderElement<ModelPersistenceService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ModelPersistenceService> create(Ref ref) {
    return modelPersistenceService(ref);
  }
}

String _$modelPersistenceServiceHash() =>
    r'22b2b74925129d20a4de48864b1d13fee32de9b2';
