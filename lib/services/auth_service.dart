// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  Future<void> initializeUser(BuildContext context) async {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        Navigator.pushNamed(context, '/login');
      } else {
        debugPrint('User is signed in!');
        Navigator.pushNamed(context, '/home');
      }
    });
  }

  Future<void> signInwithEmail(String email) async {
    ActionCodeSettings actionCodeSetting = ActionCodeSettings(
      url: 'https://electx.web.app/finishSignUp?email=$email',
      handleCodeInApp: true,
      androidPackageName: 'com.example.electx_new',
      androidInstallApp: true,
      androidMinimumVersion: '1',
    );

    try {
      await FirebaseAuth.instance.sendSignInLinkToEmail(email: email, actionCodeSettings: actionCodeSetting);
    } catch (e) {
      debugPrint("ERROR: $e");
    }
  }
}
