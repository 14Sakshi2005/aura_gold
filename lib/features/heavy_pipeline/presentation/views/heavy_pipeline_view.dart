import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeavyPipelineView extends StatelessWidget {
  const HeavyPipelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heavy Pipeline"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.precision_manufacturing,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              "Heavy Asset Processing",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Assets weighing 5 g or more undergo a complete inspection.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            Card(
              child: ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Capture 360° Images"),
                subtitle: const Text("Capture multiple images of the ornament"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.push("/camera");
                },
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const Icon(Icons.mic),
                title: const Text("Record Acoustic Tap"),
                subtitle: const Text("Capture resonance audio"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.push("/audio");
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context.push("/feature-fusion");
                },
                child: const Text("Continue"),
              ),
            )
          ],
        ),
      ),
    );
  }
}