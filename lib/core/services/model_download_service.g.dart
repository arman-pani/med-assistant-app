// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_download_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(modelDownloadService)
final modelDownloadServiceProvider = ModelDownloadServiceProvider._();

final class ModelDownloadServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<ModelDownloadService>,
          ModelDownloadService,
          FutureOr<ModelDownloadService>
        >
    with
        $FutureModifier<ModelDownloadService>,
        $FutureProvider<ModelDownloadService> {
  ModelDownloadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelDownloadServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelDownloadServiceHash();

  @$internal
  @override
  $FutureProviderElement<ModelDownloadService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ModelDownloadService> create(Ref ref) {
    return modelDownloadService(ref);
  }
}

String _$modelDownloadServiceHash() =>
    r'ede55018c009da38437e5c68d1d7db51a9d5f048';
