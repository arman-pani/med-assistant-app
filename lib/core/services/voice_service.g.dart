// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(voiceService)
final voiceServiceProvider = VoiceServiceProvider._();

final class VoiceServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<VoiceService>,
          VoiceService,
          FutureOr<VoiceService>
        >
    with $FutureModifier<VoiceService>, $FutureProvider<VoiceService> {
  VoiceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voiceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voiceServiceHash();

  @$internal
  @override
  $FutureProviderElement<VoiceService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VoiceService> create(Ref ref) {
    return voiceService(ref);
  }
}

String _$voiceServiceHash() => r'007679cbd2846cfd0e0a8ec005d6a180ba95548c';
