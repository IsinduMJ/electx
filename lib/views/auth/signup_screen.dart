import 'package:electx_new/components/custom_input_feild.dart';
import 'package:electx_new/views/auth/signin_screen.dart';
import 'package:electx_new/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/rounded_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController email = TextEditingController();
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
                child: Text("Sign Up", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 26)),
              ),
              SizedBox(height: size.height * 0.005),
              Center(
                child: Text("Sign up to make the right choice.", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16)),
              ),
              SizedBox(height: size.height * 0.065),
              CustomInputField(
                textFormField: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    // hint: Text("Student ID"),
                    border: InputBorder.none,
                    label: Text("Email", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: RoundedButton(buttonName: 'Sign Up'),
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
