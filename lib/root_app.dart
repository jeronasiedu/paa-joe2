import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planttech_2/pages/prediction_page.dart';
import 'package:planttech_2/pages/preview_page.dart';
import 'package:planttech_2/widgets/card.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final ImagePicker _picker = ImagePicker();
  Future<void> getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
      );
      if (!mounted) return;
      if (pickedFile != null) {
        Widget nextScreen = source == ImageSource.camera
            ? PredictionPage(
                imagePath: File(pickedFile.path),
              )
            : PreviewPage(imagePath: File(pickedFile.path));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => nextScreen));
      }
    } on PlatformException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There was an error taking the picture"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Plant Disease Detector',
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const MyCard(),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width * 0.6, 45),
                ),
                label: const Text("Camera"),
                icon: const Icon(Icons.camera_alt),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width * 0.6, 45),
                ),
                label: const Text("Gallery"),
                icon: const Icon(Icons.photo_library),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
