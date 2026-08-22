import 'package:electx_new/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Club Election 2026-27", style: GoogleFonts.poppins(fontSize: 19)),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios, size: 19),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CandidateCard(size: size),
            CandidateCard(size: size),
            CandidateCard(size: size),
            CandidateCard(size: size),
            CandidateCard(size: size),
            CandidateCard(size: size),
            CandidateCard(size: size),
          ],
        ),
      ),
    );
  }
}

class CandidateCard extends StatefulWidget {
  const CandidateCard({super.key, required this.size});

  final Size size;

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

bool voted = false;

class _CandidateCardState extends State<CandidateCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.14,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              height: widget.size.height * 0.125,
              width: widget.size.width * 0.775,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black26, offset: Offset(1, 1))],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(45, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("John Doe", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
                        Text("Department of ICT", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 10),
              SizedBox(
                height: widget.size.height * 0.14,
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Container(
                    height: widget.size.height * 0.11,
                    width: widget.size.height * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      // border: Border.all(color: Colors.grey.shade300, width: 4),
                      boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black26, offset: Offset(-1, 1))],
                      image: DecorationImage(image: AssetImage('assets/images/user_icon.png')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
