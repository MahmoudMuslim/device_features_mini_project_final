import 'package:equatable/equatable.dart';

abstract class AudioState extends Equatable {
  final String? recordedFilePath;
  final bool isRecording;
  final bool isPlaying;

  const AudioState({
    this.recordedFilePath,
    this.isRecording = false,
    this.isPlaying = false,
  });

  @override
  List<Object?> get props => [recordedFilePath, isRecording, isPlaying];
}

class AudioInitialState extends AudioState {
  const AudioInitialState()
    : super(recordedFilePath: null, isRecording: false, isPlaying: false);
}

class AudioRecordingState extends AudioState {
  const AudioRecordingState({super.recordedFilePath})
    : super(isRecording: true, isPlaying: false);
}

class AudioRecordedState extends AudioState {
  const AudioRecordedState({required String path, super.isPlaying = false})
    : super(recordedFilePath: path, isRecording: false);
}

class AudioPlayingState extends AudioState {
  const AudioPlayingState({required String path})
    : super(recordedFilePath: path, isRecording: false, isPlaying: true);
}

class AudioErrorState extends AudioState {
  final String message;

  const AudioErrorState({
    required this.message,
    super.recordedFilePath,
    super.isRecording,
    super.isPlaying,
  });

  @override
  List<Object?> get props => [
    message,
    recordedFilePath,
    isRecording,
    isPlaying,
  ];
}
