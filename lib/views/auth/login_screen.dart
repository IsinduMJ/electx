import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/rounded_button.dart';
import '../../components/custom_input_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
bool visibility = true;

class _LoginScreenState extends State<LoginScreen> {
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
                child: Text("Login to make the right choice.", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16)),
              ),
              SizedBox(height: size.height * 0.065),
              CustomInputField(
                textFormField: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hint: Text("john@mail.com"),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
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
