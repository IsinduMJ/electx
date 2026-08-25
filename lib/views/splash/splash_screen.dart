import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:electx_new/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();
  final _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      _authService.initializeUser(context);
      _handleIncomingLinks();
    });
  }

  void _handleIncomingLinks() {
    // Catches the link if the app was launched cold from it
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) _processLink(uri);
    });

    // Catches the link if the app was already running
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _processLink(uri);
    });
  }

  Future<void> _processLink(Uri uri) async {
    final link = uri.toString();
    if (FirebaseAuth.instance.isSignInWithEmailLink(link)) {
      final email = uri.queryParameters['email'];
      if (email == null) return;

      try {
        await FirebaseAuth.instance.signInWithEmailLink(email: email, emailLink: link);
        // navigate to home screen here
      } on FirebaseAuthException catch (e) {
        // handle invalid or expired link
      }
    }
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
