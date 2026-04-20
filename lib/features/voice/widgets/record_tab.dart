import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/clinical_voice_state.dart';
import '../models/voice_session_status.dart';
import '../providers/clinical_voice_provider.dart';
import 'pulsating_mic_widget.dart';

class RecordTab extends ConsumerWidget {
  final ClinicalVoiceState voiceState;
  final TextEditingController doctorController;
  final TextEditingController patientController;
  final TextEditingController clinicController;

  const RecordTab({
    super.key,
    required this.voiceState,
    required this.doctorController,
    required this.patientController,
    required this.clinicController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(clinicalVoiceProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: AppColors.backgroundElevated,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                    controller: doctorController,
                    decoration: const InputDecoration(labelText: 'Doctor Name'),
                    onChanged: (v) => _updateContext(notifier),
                  ),
                  TextField(
                    controller: patientController,
                    decoration: const InputDecoration(
                      labelText: 'Patient Name',
                    ),
                    onChanged: (v) => _updateContext(notifier),
                  ),
                  TextField(
                    controller: clinicController,
                    decoration: const InputDecoration(labelText: 'Clinic Name'),
                    onChanged: (v) => _updateContext(notifier),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              height: 180,
              alignment: Alignment.center,
              child: _buildMicSection(context),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Live Transcript', style: AppTextStyles.labelLarge),
          const SizedBox(height: 8),
          Container(
            height: 140,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundInput,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divider),
            ),
            child: SingleChildScrollView(
              reverse: true,
              child: Text(
                voiceState.liveTranscript.isNotEmpty
                    ? voiceState.liveTranscript
                    : 'Your dictation will appear here...',
                style: voiceState.liveTranscript.isNotEmpty
                    ? AppTextStyles.bodyMedium
                    : AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildControls(ref),
        ],
      ),
    );
  }

  void _updateContext(ClinicalVoiceNotifier notifier) {
    notifier.setPatientContext(
      doctorName: doctorController.text,
      patientName: patientController.text,
      clinicName: clinicController.text,
    );
  }

  Widget _buildMicSection(BuildContext context) {
    switch (voiceState.status) {
      case VoiceSessionStatus.idle:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.mic_none_outlined,
              size: 72,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 12),
            Text(
              'Tap the button below to start',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        );
      case VoiceSessionStatus.listening:
        return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PulsatingMicWidget(),
            SizedBox(height: 12),
            Text(
              'Listening...',
              style: TextStyle(color: AppColors.primaryYellow, fontSize: 14),
            ),
          ],
        );
      case VoiceSessionStatus.processing:
        return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: AppColors.primaryYellow),
            SizedBox(height: 12),
            Text(
              'Generating prescription...',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ],
        );
      case VoiceSessionStatus.done:
        return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: AppColors.success,
            ),
            SizedBox(height: 12),
            Text(
              'Prescription ready',
              style: TextStyle(color: AppColors.success, fontSize: 14),
            ),
          ],
        );
      case VoiceSessionStatus.error:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Text(
              voiceState.errorMessage ?? 'Error',
              style: const TextStyle(color: AppColors.error, fontSize: 13),
            ),
          ],
        );
    }
  }

  Widget _buildControls(WidgetRef ref) {
    final status = voiceState.status;
    final notifier = ref.read(clinicalVoiceProvider.notifier);

    if (status == VoiceSessionStatus.idle ||
        status == VoiceSessionStatus.done ||
        status == VoiceSessionStatus.error) {
      return SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          onPressed: () => notifier.startListening(),
          icon: const Icon(Icons.mic),
          label: Text(
            status == VoiceSessionStatus.done
                ? 'Record Again'
                : 'Start Recording',
          ),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primaryYellow,
            foregroundColor: Colors.black,
          ),
        ),
      );
    }

    if (status == VoiceSessionStatus.listening) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton.icon(
            onPressed: () => notifier.cancelListening(),
            icon: const Icon(Icons.cancel_outlined),
            label: const Text('Cancel'),
          ),
          FilledButton.icon(
            onPressed: () => notifier.stopAndProcess(),
            icon: const Icon(Icons.stop_rounded),
            label: const Text('Stop & Generate'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error.withValues(alpha: 0.8),
            ),
          ),
        ],
      );
    }

    if (status == VoiceSessionStatus.processing) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () => notifier.reset(),
          child: const Text('Cancel Generation'),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
