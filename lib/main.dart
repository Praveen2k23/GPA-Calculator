import 'package:flutter/material.dart';
import 'screens/input_screen.dart';

void main() {
  runApp(const GPACalculatorApp());
}

class GPACalculatorApp extends StatelessWidget {
  const GPACalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF9F5FF),
        cardColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const InputScreen(),
    );
  }
}