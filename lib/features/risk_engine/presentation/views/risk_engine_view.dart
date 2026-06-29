import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RiskEngineView extends StatelessWidget {
  const RiskEngineView({super.key});

  @override
  Widget build(BuildContext context) {
    // ------------------------------------------------------------
    // Temporary Offline Risk Engine (Hackathon Demo)
    // Replace later with actual AI model
    // ------------------------------------------------------------

    double weight = 6.5;
    int karat = 22;

    bool imageCaptured = true;
    bool audioCaptured = true;

    // Authenticity Score (0–100)
    int authenticity = 100;

    // Lower karat reduces confidence
    authenticity -= (24 - karat) * 8;

    // Missing evidence reduces confidence
    if (!imageCaptured) authenticity -= 30;
    if (!audioCaptured) authenticity -= 20;

    // Very light ornaments are slightly harder
    if (weight < 5) authenticity -= 10;

    authenticity = authenticity.clamp(0, 100);

    final genuine = authenticity >= 80;

    Color color;
    String decision;
    IconData icon;

    if (authenticity >= 80) {
      color = Colors.green;
      decision = "GENUINE";
      icon = Icons.verified;
    } else if (authenticity >= 50) {
      color = Colors.orange;
      decision = "SUSPICIOUS";
      icon = Icons.warning_amber_rounded;
    } else {
      color = Colors.red;
      decision = "LIKELY FAKE";
      icon = Icons.cancel;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Risk Assessment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "Authentication Result",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 30),

            Icon(
              icon,
              size: 110,
              color: color,
            ),

            const SizedBox(height: 20),

            Text(
              "$authenticity%",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              decision,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 40),

            Card(
              child: ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text("Image Analysis"),
                subtitle: Text(
                  imageCaptured ? "Completed" : "Missing",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.graphic_eq),
                title: const Text("Acoustic Analysis"),
                subtitle: Text(
                  audioCaptured ? "Completed" : "Missing",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.scale),
                title: const Text("Weight Verification"),
                subtitle: Text(
                  "${weight.toStringAsFixed(2)} g • ${karat}K",
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context.go("/audit-log");
                },
                child: const Text("View Audit Log"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}