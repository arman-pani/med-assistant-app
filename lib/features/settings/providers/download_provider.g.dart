// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DownloadNotifier)
final downloadProvider = DownloadNotifierFamily._();

final class DownloadNotifierProvider
    extends $NotifierProvider<DownloadNotifier, ModelDownloadState> {
  DownloadNotifierProvider._({
    required DownloadNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'downloadProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$downloadNotifierHash();

  @override
  String toString() {
    return r'downloadProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DownloadNotifier create() => DownloadNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModelDownloadState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModelDownloadState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$downloadNotifierHash() => r'41b19e42adc9c5bd3be4b097d6f0d2c96719268e';

final class DownloadNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          DownloadNotifier,
          ModelDownloadState,
          ModelDownloadState,
          ModelDownloadState,
          String
        > {
  DownloadNotifierFamily._()
    : super(
        retry: null,
        name: r'downloadProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DownloadNotifierProvider call(String modelId) =>
      DownloadNotifierProvider._(argument: modelId, from: this);

  @override
  String toString() => r'downloadProvider';
}

abstract class _$DownloadNotifier extends $Notifier<ModelDownloadState> {
  late final _$args = ref.$arg as String;
  String get modelId => _$args;

  ModelDownloadState build(String modelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ModelDownloadState, ModelDownloadState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModelDownloadState, ModelDownloadState>,
              ModelDownloadState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
