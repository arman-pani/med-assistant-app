// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_voice_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClinicalVoiceNotifier)
final clinicalVoiceProvider = ClinicalVoiceNotifierProvider._();

final class ClinicalVoiceNotifierProvider
    extends $NotifierProvider<ClinicalVoiceNotifier, ClinicalVoiceState> {
  ClinicalVoiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clinicalVoiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clinicalVoiceNotifierHash();

  @$internal
  @override
  ClinicalVoiceNotifier create() => ClinicalVoiceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClinicalVoiceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClinicalVoiceState>(value),
    );
  }
}

String _$clinicalVoiceNotifierHash() =>
    r'573b69e1cfcb3dbefa859ad03cb31809285a08d8';

abstract class _$ClinicalVoiceNotifier extends $Notifier<ClinicalVoiceState> {
  ClinicalVoiceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClinicalVoiceState, ClinicalVoiceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClinicalVoiceState, ClinicalVoiceState>,
              ClinicalVoiceState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
