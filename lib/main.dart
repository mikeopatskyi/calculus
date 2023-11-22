import 'package:calculus/screens/home_screen.dart';
import 'package:calculus/store/calculator_store.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const CalculusApp());
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       Provider<CalculatorStore>(
  //         create: (_) => CalculatorStore(),
  //       ),
  //     ],
  //     child: const CalculusApp(),
  //   ),
  // );
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
