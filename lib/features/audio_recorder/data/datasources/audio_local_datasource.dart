import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

abstract class AudioLocalDataSource {
  Future<bool> startRecording();
  Future<String?> stopRecording();
  Future<void> playAudio(String path);
  Future<void> stopPlayback();
  Future<bool> isRecording();
  Future<bool> isPlaying();
}

class AudioLocalDataSourceImpl implements AudioLocalDataSource {
  final AudioRecorder recorder;
  final AudioPlayer player;

  AudioLocalDataSourceImpl({required this.recorder, required this.player});

  @override
  Future<bool> startRecording() async {
    // Record voice using record package
    final hasPermission = await recorder.hasPermission();
    if (!hasPermission) {
      throw Exception('Microphone permission not granted.');
    }

    final tempDir = await getTemporaryDirectory();
    final String path =
        '${tempDir.path}/recorded_voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: path,
    );
    return true;
  }

  @override
  Future<String?> stopRecording() async {
    final path = await recorder.stop();
    return path;
  }

  @override
  Future<void> playAudio(String path) async {
    // Play back recorded audio using audioplayers package
    await player.stop();
    await player.play(DeviceFileSource(path));
  }

  @override
  Future<void> stopPlayback() async {
    await player.stop();
  }

  @override
  Future<bool> isRecording() async {
    return await recorder.isRecording();
  }

  @override
  Future<bool> isPlaying() async {
    return player.state == PlayerState.playing;
  }
}
