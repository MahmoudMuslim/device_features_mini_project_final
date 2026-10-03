import 'package:flutter/material.dart';

/// "Record Audio" button to start and stop voice recording.
class RecordAudioButtonWidget extends StatelessWidget {
  final bool isRecording;
  final VoidCallback onTap;

  const RecordAudioButtonWidget({
    super.key,
    required this.isRecording,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isRecording ? Colors.red : Colors.deepPurple,
              boxShadow: [
                BoxShadow(
                  color: (isRecording ? Colors.red : Colors.deepPurple)
                      .withAlpha(100),
                  blurRadius: 16,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Icon(
              isRecording ? Icons.stop : Icons.mic,
              size: 48,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          isRecording ? 'Recording... Tap to Stop' : 'Record Audio',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isRecording ? Colors.red : Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
