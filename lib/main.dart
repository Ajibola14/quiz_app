import 'package:flutter/material.dart';
import 'package:quiz_app/displayQuestion.dart';
import 'package:quiz_app/operation.dart';

import 'difficulty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Operation(),
    );
  }
}
