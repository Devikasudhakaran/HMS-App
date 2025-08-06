import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hms/application/features/presentation/login_screen.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
                'assets/img/splash_page.jpg',
                fit: BoxFit.cover,
              ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.black.withOpacity(0.6), // Dark overlay
              ),
            ),
          ),

          Center(
            child: Image.asset(
              'assets/img/logo.png',
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
