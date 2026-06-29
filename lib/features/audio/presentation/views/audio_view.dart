import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AudioView extends StatefulWidget {
  const AudioView({super.key});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  bool isRecording = false;
  bool recordingCompleted = false;

  void startRecording() {
    setState(() {
      isRecording = true;
      recordingCompleted = false;
    });
  }

  void stopRecording() {
    setState(() {
      isRecording = false;
      recordingCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acoustic Recording"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              isRecording ? Icons.mic : Icons.mic_none,
              size: 90,
              color: isRecording ? Colors.red : Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              "Tap the ornament gently and record its resonance.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 40),

            FilledButton.icon(
              onPressed: isRecording ? null : startRecording,
              icon: const Icon(Icons.fiber_manual_record),
              label: const Text("Start Recording"),
            ),

            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: isRecording ? stopRecording : null,
              icon: const Icon(Icons.stop),
              label: const Text("Stop Recording"),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: recordingCompleted
                    ? () => context.push("/feature-fusion")
                    : null,
                child: const Text("Continue"),
              ),
            )
          ],
        ),
      ),
    );
  }
}