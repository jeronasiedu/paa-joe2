import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planttech_2/root_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Tech 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
          ),
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          )),
      home: const RootApp(),
    );
  }
}
