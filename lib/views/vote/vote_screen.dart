import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/candidate_card.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Club Election 2026-27", style: GoogleFonts.poppins(fontSize: 19)),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Navigator.pushNamed(context, '/home'), icon: Icon(Icons.arrow_back_ios, size: 19)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [CandidateCard(), CandidateCard(), CandidateCard(), CandidateCard(), CandidateCard(), CandidateCard(), CandidateCard()],
        ),
      ),
    );
  }
}
