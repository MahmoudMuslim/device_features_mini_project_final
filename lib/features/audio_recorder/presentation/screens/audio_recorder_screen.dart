import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/audio_bloc.dart';
import '../bloc/audio_event.dart';
import '../bloc/audio_state.dart';
import '../widgets/play_audio_button_widget.dart';
import '../widgets/record_audio_button_widget.dart';

/// Screen for recording voice audio and playing it back upon completion.
class AudioRecorderScreen extends StatelessWidget {
  const AudioRecorderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<AudioBloc, AudioState>(
            listener: (context, state) {
              if (state is AudioErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isRecording = state.isRecording;
              final isPlaying = state.isPlaying;
              final hasRecording =
                  state.recordedFilePath != null &&
                  state.recordedFilePath!.isNotEmpty;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.audiotrack,
                    size: 72,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Voice Audio Recorder',
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Record your voice and listen to playback',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 48),

                  // Record Audio Button
                  RecordAudioButtonWidget(
                    isRecording: isRecording,
                    onTap: () {
                      if (isRecording) {
                        context.read<AudioBloc>().add(StopRecordingEvent());
                      } else {
                        context.read<AudioBloc>().add(StartRecordingEvent());
                      }
                    },
                  ),

                  const SizedBox(height: 36),

                  // Play Audio Button (Appears once a recording exists)
                  if (hasRecording) ...[
                    PlayAudioButtonWidget(
                      isPlaying: isPlaying,
                      onTap: () {
                        if (isPlaying) {
                          context.read<AudioBloc>().add(
                            StopAudioPlaybackEvent(),
                          );
                        } else {
                          context.read<AudioBloc>().add(PlayAudioEvent());
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Recording Saved Successfully',
                      style: TextStyle(fontSize: 12, color: Colors.green[700]),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
