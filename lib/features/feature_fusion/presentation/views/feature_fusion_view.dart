import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureFusionView extends StatefulWidget {
  const FeatureFusionView({super.key});

  @override
  State<FeatureFusionView> createState() => _FeatureFusionViewState();
}

class _FeatureFusionViewState extends State<FeatureFusionView> {
  bool processing = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      setState(() {
        processing = false;
      });

      context.go("/risk-engine");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feature Fusion"),
      ),
      body: Center(
        child: processing
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 30),
                  Text(
                    "Extracting image features...\n"
                    "Extracting acoustic features...\n"
                    "Fusing multimodal data...",
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : const Icon(Icons.check_circle, size: 100),
      ),
    );
  }
}