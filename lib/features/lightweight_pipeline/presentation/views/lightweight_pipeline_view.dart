import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LightweightPipelineView extends StatelessWidget {
  const LightweightPipelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lightweight Pipeline"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.camera,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              "Lightweight Asset Processing",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Capture one image with a ₹1 coin placed beside the ornament for scale.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            Card(
              child: ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Capture Image"),
                subtitle: const Text("Single image with reference coin"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.push("/camera", extra: "demo_asset");
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
            ),
          ],
        ),
      ),
    );
  }
}