import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planttech_2/pages/prediction_page.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final File imagePath;
  @override
  Widget build(BuildContext context) {
    final btnStyle = ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 18,
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Column(
        children: [
          InteractiveViewer(
            child: Image.file(
              imagePath,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.45,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: btnStyle,
                  child: const Text('Choose another Image '),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PredictionPage(
                        imagePath: imagePath,
                      ),
                    ));
                  },
                  style: btnStyle,
                  child: const Text('Use this Image'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
