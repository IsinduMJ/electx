import 'dart:async';

import 'package:electx_new/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/signup'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            // Text('ElectX', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 25)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 100), child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
