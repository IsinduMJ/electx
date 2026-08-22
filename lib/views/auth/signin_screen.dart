import 'package:electx_new/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_input_feild.dart';
import '../../components/rounded_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
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
                child: Text("Sign In", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 26)),
              ),
              SizedBox(height: size.height * 0.005),
              Center(
                child: Text("Create a new account.", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16)),
              ),
              SizedBox(height: size.height * 0.065),
              CustomInputField(
                textFormField: TextFormField(
                  controller: firstName,
                  decoration: InputDecoration(
                    // hint: Text("Student ID"),
                    border: InputBorder.none,
                    label: Text("First Name", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              CustomInputField(
                textFormField: TextFormField(
                  controller: lastName,
                  decoration: InputDecoration(
                    // hint: Text("Student ID"),
                    border: InputBorder.none,
                    label: Text("Last Name", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
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
                onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupScreen())),
                child: RoundedButton(size: size),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
