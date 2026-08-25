import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/rounded_button.dart';
import '../../components/custom_input_feild.dart';
import '../../services/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: size.height * 0.05),
              Center(
                child: Text("Login", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 26)),
              ),
              SizedBox(height: size.height * 0.005),
              Center(
                child: Text("Log into make the right choice.", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16)),
              ),
              SizedBox(height: size.height * 0.065),
              CustomInputField(
                textFormField: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
                    label: Text("Email", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              CustomInputField(
                textFormField: TextFormField(
                  controller: password,
                  obscureText: true,
                  // keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    // hint: Text("Student ID"),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.password_outlined),
                    label: Text("Password", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              GestureDetector(
                onTap: () async {
                  debugPrint("Email: ${email.text.trim()}");
                  try {
                    // await AuthService().signInwithEmail(email.text.trim());
                    Navigator.pushNamed(context, '/home');
                  } catch (e) {
                    debugPrint("ERROR: $e");
                  }
                },
                child: RoundedButton(buttonName: 'Login'),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/signin'),
                    child: Text("Sign In", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15)),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
