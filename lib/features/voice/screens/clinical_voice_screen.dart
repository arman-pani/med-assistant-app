import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/services/prescription_pdf_service.dart';
import '../models/clinical_voice_state.dart';
import '../models/voice_session_status.dart';
import '../providers/clinical_voice_provider.dart';
import '../widgets/record_tab.dart';
import '../widgets/prescription_tab.dart';

class ClinicalVoiceScreen extends ConsumerStatefulWidget {
  const ClinicalVoiceScreen({super.key});

  @override
  ConsumerState<ClinicalVoiceScreen> createState() =>
      _ClinicalVoiceScreenState();
}

class _ClinicalVoiceScreenState extends ConsumerState<ClinicalVoiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _patientController = TextEditingController();
  final TextEditingController _clinicController = TextEditingController();
  final TextEditingController _prescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    final initState = ref.read(clinicalVoiceProvider);
    _doctorController.text = initState.doctorName;
    _patientController.text = initState.patientName;
    _clinicController.text = initState.clinicName;
    _prescriptionController.text = initState.prescriptionMarkdown;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final status = await Permission.microphone.request();
      if (!status.isGranted && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Microphone permission is required for voice recording.',
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _doctorController.dispose();
    _patientController.dispose();
    _clinicController.dispose();
    _prescriptionController.dispose();
    super.dispose();
  }

  Future<void> _exportPdf() async {
    final voiceState = ref.read(clinicalVoiceProvider);
    final service = PrescriptionPdfService();
    try {
      final pdf = await service.buildPdf(
        prescriptionMarkdown: voiceState.prescriptionMarkdown,
        patientName: voiceState.patientName,
        doctorName: voiceState.doctorName,
        clinicName: voiceState.clinicName,
        clinicalNotes: voiceState.finalTranscript,
      );
      await service.previewAndShare(pdf);
      final path = await service.savePdf(pdf, voiceState.patientName);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prescription saved to:\n$path')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not export PDF: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final voiceState = ref.watch(clinicalVoiceProvider);

    ref.listen<ClinicalVoiceState>(clinicalVoiceProvider, (prev, next) {
      if (next.status == VoiceSessionStatus.done &&
          prev?.status != VoiceSessionStatus.done) {
        _tabController.animateTo(1);
      }
      if (next.prescriptionMarkdown != prev?.prescriptionMarkdown &&
          next.prescriptionMarkdown != _prescriptionController.text) {
        _prescriptionController.text = next.prescriptionMarkdown;
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Clinical Voice Mode'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryYellow,
          labelColor: AppColors.primaryYellow,
          unselectedLabelColor: AppColors.textSecondary,
          tabs: const [
            Tab(text: 'Record'),
            Tab(text: 'Prescription'),
          ],
        ),
        actions: [
          if (voiceState.status == VoiceSessionStatus.done)
            IconButton(
              icon: const Icon(Icons.picture_as_pdf_outlined),
              onPressed: _exportPdf,
              tooltip: 'Export PDF',
            ),
        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            RecordTab(
              voiceState: voiceState,
              doctorController: _doctorController,
              patientController: _patientController,
              clinicController: _clinicController,
            ),
            PrescriptionTab(
              voiceState: voiceState,
              prescriptionController: _prescriptionController,
              onExport: _exportPdf,
            ),
          ],
        ),
      ),
    );
  }
}
