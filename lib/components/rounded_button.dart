import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.buttonName});

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.5),
      // margin: EdgeInsets.all(50),
      width: size.width * 0.775,
      height: size.height * 0.055,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1),
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(max(10, 30))),
      ),
      child: Center(
        child: Text(buttonName, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
