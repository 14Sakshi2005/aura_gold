import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aura_gold/core/database/database_service.dart';

class CameraView extends StatefulWidget {
  final String assetId;

  const CameraView({
    super.key,
    required this.assetId,
  });

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final ImagePicker _picker = ImagePicker();

  List<XFile> images = [];
  bool isSaving = false;

  Future<void> captureImage() async {
    final file = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );

    if (file != null) {
      setState(() {
        images.add(file);
      });
    }
  }

  Future<void> saveAndContinue() async {
    if (images.isEmpty || isSaving) return;

    setState(() {
      isSaving = true;
    });

    try {
      for (final img in images) {
        await DatabaseService.instance.saveCapturedMedia(
          assetId: widget.assetId,
          mediaType: "image",
          filePath: img.path,
        );
      }

      if (!mounted) return;

      context.push("/feature-fusion");
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Capture"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: images.isEmpty
                  ? Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(Icons.camera_alt, size: 80),
                      ),
                    )
                  : GridView.builder(
                      itemCount: images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(images[index].path),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: captureImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text("Capture Image"),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: (images.isEmpty || isSaving)
                    ? null
                    : saveAndContinue,
                child: isSaving
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Continue"),
              ),
            )
          ],
        ),
      ),
    );
  }
}