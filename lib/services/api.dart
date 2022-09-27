import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<dynamic> analyzePlant(String imagePath) async {
  final imageBytes = File(imagePath).readAsBytesSync();
  String imageBase64 = base64Encode(imageBytes);
  final dio = Dio();

  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(imagePath, filename: "image.jpg"),
  });
  try {
    final response = await dio.post(
      "https://us-central1-potatoe-disease-classification.cloudfunctions.net/predict",
      data: formData,
    );
    return response.data;
  } catch (e) {
    debugPrint(
      e.toString(),
    );
  }
}
