// ignore_for_file: unused_field
import 'dart:async';
import 'package:digital_wallet/Screens/login_screen.dart';
import 'package:digital_wallet/Screens/onBoarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (c) {
        return OnBoardingScreen();
      }),
    );
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 220.0,
              ),
              SizedBox(
                width: 100,
                height: 100.0,
                child: Image.asset(
                  'assets/images/R.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Wallet App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Designed By",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "R-A-M",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
