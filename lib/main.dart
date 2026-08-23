import 'package:electx_new/firebase_options.dart';
import 'package:electx_new/views/auth/signin_screen.dart';
import 'package:electx_new/views/auth/signup_screen.dart';
import 'package:electx_new/views/home/home_screen.dart';
import 'package:electx_new/views/splash/splash_screen.dart';
import 'package:electx_new/views/vote/vote_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      // ),
      // home: const SplashScreen(),
      routes: {
        '/': (context) => const SplashScreen(),
        '/signup': (context) => SignupScreen(),
        '/signin': (context) => SigninScreen(),
        '/home': (context) => HomeScreen(),
        '/vote': (context) => VoteScreen(),
      },
    );
  }
}
