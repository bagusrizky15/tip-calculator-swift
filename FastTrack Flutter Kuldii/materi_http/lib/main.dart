import 'package:flutter/material.dart';
import 'package:materi_http/homepage.dart';
import 'package:materi_http/introduction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Introduction(),
    );
  }
}