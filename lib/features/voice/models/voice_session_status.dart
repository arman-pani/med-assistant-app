enum VoiceSessionStatus {
  idle, // nothing happening
  listening, // mic is active, capturing speech
  processing, // sending transcript to MedGemma
  done, // MedGemma has produced prescription output
  error,
}
