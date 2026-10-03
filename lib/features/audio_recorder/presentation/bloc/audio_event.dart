import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object?> get props => [];
}

class StartRecordingEvent extends AudioEvent {}

class StopRecordingEvent extends AudioEvent {}

class PlayAudioEvent extends AudioEvent {}

class StopAudioPlaybackEvent extends AudioEvent {}
