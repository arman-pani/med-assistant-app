# MedGemma Flutter Chat

A local-first medical AI chat application built with Flutter and llama.cpp (via llamadart). Runs entirely on-device — no cloud, no data sharing.

## Getting a Model

MedGemma runs GGUF model files locally. Download a quantized model from Hugging Face:

1. Go to [bartowski/medgemma-4b-it-GGUF](https://huggingface.co/bartowski/medgemma-4b-it-GGUF)
2. Download a quantized variant — **Q4_K_M** recommended for balance of quality and speed
3. Push to your Android device:

```bash
adb push medgemma-4b-it-Q4_K_M.gguf /sdcard/Download/
```

Enter the full path (e.g., `/sdcard/Download/medgemma-4b-it-Q4_K_M.gguf`) in the app's model selection screen.

## Building

```bash
flutter pub get
flutter run
```

## Supported Platforms

- Android arm64
- iOS (16.4+)
- macOS
- Linux
- Windows

Per [llamadart's platform matrix](https://pub.dev/packages/llamadart).

## Disclaimer

**This app provides general health information only. Always consult a qualified healthcare professional for medical advice. Never rely on this app for definitive medical decisions.**