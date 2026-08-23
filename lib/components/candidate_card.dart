import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateCard extends StatefulWidget {
  const CandidateCard({super.key});

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

bool voted = false;

class _CandidateCardState extends State<CandidateCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.14,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              height: size.height * 0.125,
              width: size.width * 0.775,
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
                        Text("Department of ICT", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12)),
                      ],
                    ),
                    Container(
                      height: size.height * 0.03,
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                        color: voted ? Colors.green.withAlpha(40) : Colors.black.withAlpha(10),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            voted = !voted;
                          });
                        },
                        child: Center(
                          child: voted
                              ? Text(
                                  'Voted',
                                  style: GoogleFonts.poppins(color: Colors.green, fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  'Vote',
                                  style: GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
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
                height: size.height * 0.14,
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Container(
                    height: size.height * 0.11,
                    width: size.height * 0.11,
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
