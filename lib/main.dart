import 'package:flutter/material.dart';

import 'Screens/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

void sqfliteFfiInit() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet App',
      home: SplashScreen(),
    );
  }
}
