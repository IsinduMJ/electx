import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_input_feild.dart';
import '../../components/rounded_button.dart';
import 'login_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

TextEditingController fullName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  controller: fullName,
                  decoration: InputDecoration(
                    hint: Text("John Doe"),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.abc),
                    label: Text("Full Name", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              CustomInputField(
                textFormField: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hint: Text("john@mail.com"),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email_outlined),
                    label: Text("Email", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              CustomInputField(
                textFormField: TextFormField(
                  controller: password,
                  obscureText: visibility,
                  decoration: InputDecoration(
                    hint: Text("••••••••"),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibility = !visibility;
                        });
                      },
                      icon: Icon(visibility ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                    ),
                    label: Text("Password", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: RoundedButton(buttonName: 'Sign In'),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
