import 'dart:math';

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.textFormField});
  final TextFormField textFormField;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      // margin: EdgeInsets.all(50),
      width: size.width * 0.875,
      height: size.height * 0.055,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1),
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(max(10, 30))),
      ),
      child: textFormField,
    );
  }
}
