import '../../domain/repositories/audio_repository.dart';
import '../datasources/audio_local_datasource.dart';

class AudioRepositoryImpl implements AudioRepository {
  final AudioLocalDataSource localDataSource;

  AudioRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> startRecording() => localDataSource.startRecording();

  @override
  Future<String?> stopRecording() => localDataSource.stopRecording();

  @override
  Future<void> playAudio(String path) => localDataSource.playAudio(path);

  @override
  Future<void> stopPlayback() => localDataSource.stopPlayback();

  @override
  Future<bool> isRecording() => localDataSource.isRecording();

  @override
  Future<bool> isPlaying() => localDataSource.isPlaying();
}
