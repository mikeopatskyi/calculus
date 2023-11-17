import 'package:calculus/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculusApp());
}

class CalculusApp extends StatelessWidget {
  const CalculusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculus',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Calculus'),
    );
  }
}
