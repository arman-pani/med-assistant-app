import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/recommended_model.dart';
export '../models/recommended_model.dart';

part 'model_download_service.g.dart';

class ModelDownloadService {
  ModelDownloadService(this._documentsDir);
  final String _documentsDir;

  final Map<String, HttpClient> _activeClients = {};

  String _modelsDir() {
    final dir = Directory('$_documentsDir/models');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    return dir.path;
  }

  String localPath(RecommendedModel model) {
    return '${_modelsDir()}/${model.fileName}';
  }

  bool isDownloaded(RecommendedModel model) {
    return File(localPath(model)).existsSync();
  }

  Future<void> downloadModel(
    RecommendedModel model, {
    required void Function(int receivedBytes, double progress) onProgress,
    required void Function() onComplete,
    required void Function(String error) onError,
  }) async {
    if (_activeClients[model.id] != null) {
      return;
    }

    final client = HttpClient();
    client.connectionTimeout = const Duration(minutes: 10);
    client.idleTimeout = const Duration(minutes: 10);
    _activeClients[model.id] = client;

    final tempPath = '${localPath(model)}.tmp';

    try {
      final request = await client.getUrl(Uri.parse(model.downloadUrl));
      request.headers.set('User-Agent', 'medgemma-flutter-app/1.0');

      final response = await request.close();
      final sink = File(tempPath).openWrite();

      final contentLength = response.contentLength;
      final knownTotal = contentLength > 0 ? contentLength : model.fileSizeBytes;

      int received = 0;
      int lastReported = 0;
      const reportInterval = 256 * 1024; // 256 KB

      await for (final chunk in response) {
        sink.add(chunk);
        received += chunk.length;

        if (received - lastReported >= reportInterval || received == knownTotal) {
          lastReported = received;
          final progressValue = received / knownTotal;
          onProgress(received, progressValue > 1.0 ? 1.0 : progressValue);
        }
      }

      await sink.flush();
      await sink.close();

      final tempFile = File(tempPath);
      if (await tempFile.exists()) {
        await tempFile.rename(localPath(model));
      }

      _activeClients.remove(model.id);
      onProgress(knownTotal, 1.0);
      onComplete();
    } catch (e) {
      _activeClients.remove(model.id);

      final tempFile = File(tempPath);
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      onError('Download failed: ${e.toString()}');
    }
  }

  Future<void> cancelDownload(RecommendedModel model) async {
    final client = _activeClients.remove(model.id);
    if (client != null) {
      client.close(force: true);
    }

    final tempPath = '${localPath(model)}.tmp';
    final tempFile = File(tempPath);
    if (await tempFile.exists()) {
      await tempFile.delete();
    }
  }

  Future<void> deleteModel(RecommendedModel model) async {
    final file = File(localPath(model));
    if (await file.exists()) {
      await file.delete();
    }
  }
}

@Riverpod(keepAlive: true)
Future<ModelDownloadService> modelDownloadService(Ref ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return ModelDownloadService(dir.path);
}
