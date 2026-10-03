abstract class AudioRepository {
  Future<bool> startRecording();
  Future<String?> stopRecording();
  Future<void> playAudio(String path);
  Future<void> stopPlayback();
  Future<bool> isRecording();
  Future<bool> isPlaying();
}
