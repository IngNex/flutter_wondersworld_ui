import 'package:flutter/material.dart';
import 'package:flutter_wondersworld_ui/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wonders World',
      home: const HomeScreen(),
    );
  }
}
