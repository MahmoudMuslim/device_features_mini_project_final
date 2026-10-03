import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/audio_repository.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioRepository repository;

  AudioBloc({required this.repository}) : super(const AudioInitialState()) {
    on<StartRecordingEvent>(_onStartRecording);
    on<StopRecordingEvent>(_onStopRecording);
    on<PlayAudioEvent>(_onPlayAudio);
    on<StopAudioPlaybackEvent>(_onStopAudioPlayback);
  }

  Future<void> _onStartRecording(
    StartRecordingEvent event,
    Emitter<AudioState> emit,
  ) async {
    try {
      await repository.startRecording();
      emit(AudioRecordingState(recordedFilePath: state.recordedFilePath));
    } catch (e) {
      emit(
        AudioErrorState(
          message: 'Failed to start recording: ${e.toString()}',
          recordedFilePath: state.recordedFilePath,
        ),
      );
    }
  }

  Future<void> _onStopRecording(
    StopRecordingEvent event,
    Emitter<AudioState> emit,
  ) async {
    try {
      final path = await repository.stopRecording();
      if (path != null && path.isNotEmpty) {
        emit(AudioRecordedState(path: path));
      } else {
        emit(
          AudioErrorState(
            message: 'Recording path is empty',
            recordedFilePath: state.recordedFilePath,
          ),
        );
      }
    } catch (e) {
      emit(
        AudioErrorState(
          message: 'Failed to stop recording: ${e.toString()}',
          recordedFilePath: state.recordedFilePath,
        ),
      );
    }
  }

  Future<void> _onPlayAudio(
    PlayAudioEvent event,
    Emitter<AudioState> emit,
  ) async {
    final path = state.recordedFilePath;
    if (path == null || path.isEmpty) {
      emit(
        const AudioErrorState(message: 'No recorded audio available to play.'),
      );
      return;
    }

    try {
      emit(AudioPlayingState(path: path));
      await repository.playAudio(path);
    } catch (e) {
      emit(
        AudioErrorState(
          message: 'Playback error: ${e.toString()}',
          recordedFilePath: path,
        ),
      );
    }
  }

  Future<void> _onStopAudioPlayback(
    StopAudioPlaybackEvent event,
    Emitter<AudioState> emit,
  ) async {
    final path = state.recordedFilePath;
    try {
      await repository.stopPlayback();
      if (path != null) {
        emit(AudioRecordedState(path: path, isPlaying: false));
      } else {
        emit(const AudioInitialState());
      }
    } catch (e) {
      emit(
        AudioErrorState(
          message: 'Failed to stop audio playback: ${e.toString()}',
          recordedFilePath: path,
        ),
      );
    }
  }
}
