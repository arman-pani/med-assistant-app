import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/clinical_voice_state.dart';
import '../models/voice_session_status.dart';
import '../providers/clinical_voice_provider.dart';

class PrescriptionTab extends ConsumerWidget {
  final ClinicalVoiceState voiceState;
  final TextEditingController prescriptionController;
  final VoidCallback onExport;

  const PrescriptionTab({
    super.key,
    required this.voiceState,
    required this.prescriptionController,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(clinicalVoiceProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (voiceState.status != VoiceSessionStatus.done &&
              voiceState.prescriptionMarkdown.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'Record a consultation to generate a prescription.',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            )
          else ...[
            if (voiceState.isGenerating) ...[
              const LinearProgressIndicator(color: AppColors.primaryYellow),
              const SizedBox(height: 8),
              const Text(
                'MedGemma is writing your prescription...',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 12),
            ],
            Expanded(
              child: TextField(
                controller: prescriptionController,
                maxLines: null,
                expands: true,
                style: AppTextStyles.bodyMedium,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Prescription will appear here...',
                  alignLabelWithHint: true,
                ),
                onChanged: (v) => notifier.updatePrescription(v),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  onPressed: voiceState.finalTranscript.isNotEmpty &&
                          !voiceState.isGenerating
                      ? () => notifier.stopAndProcess()
                      : null,
                  icon: const Icon(Icons.refresh_outlined),
                  label: const Text('Regenerate'),
                ),
                FilledButton.icon(
                  onPressed: voiceState.prescriptionMarkdown.isNotEmpty
                      ? onExport
                      : null,
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Export PDF'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primaryYellow,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
