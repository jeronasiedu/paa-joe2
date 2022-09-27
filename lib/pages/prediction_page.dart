// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planttech_2/root_app.dart';
import 'package:planttech_2/services/api.dart';
import 'package:planttech_2/widgets/remedy.dart';

class PredictionPage extends StatelessWidget {
  const PredictionPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final File imagePath;
  @override
  Widget build(BuildContext context) {
    final h6 = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Predictions"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const RootApp(),
            ));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
        future: analyzePlant(imagePath.path),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                  "There was an error finding the disease, try again later"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasData) {
            final data = snapshot.data;
            final String type = data['class'];
            final confidence = data['confidence'];
            final String lowercaseType = type.toLowerCase();
            return ListView(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.45,
                  ),
                  child: Image.file(
                    imagePath,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Condition",
                    style: h6,
                  ),
                  subtitle: Text(
                    type,
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Confidence",
                    style: h6,
                  ),
                  subtitle: Text(
                    "$confidence%",
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                Remedy(lowercaseType: lowercaseType)
              ],
            );
          }

          return Center(
            child: Column(
              children: [
                Text(
                  "Comrade we're sorry, try again later",
                  style: h6,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const RootApp(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 18,
                      ),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 40),
                    ),
                    child: const Text("Try Again"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
