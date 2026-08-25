import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timestamp extends StatelessWidget {
  const Timestamp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green.withAlpha(30), borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            Icon(Icons.timer_outlined, color: Colors.green, size: 15),
            SizedBox(width: 5),
            Text(
              '20/10/2026',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
