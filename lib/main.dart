import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 122, 17, 221),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}
