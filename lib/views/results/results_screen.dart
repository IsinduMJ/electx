import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

double finalVoteCount = 427;
double candidateA = 300;

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Club Election 2026-27", style: GoogleFonts.poppins(fontSize: 19)),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Navigator.pushNamed(context, '/home'), icon: Icon(Icons.arrow_back_ios, size: 19)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VotePrecentageIndicator(finalVoteCount: finalVoteCount),
              CandidateResultCard(finalVoteCount: finalVoteCount, candidateA: candidateA),
              CandidateResultCard(finalVoteCount: finalVoteCount, candidateA: candidateA),
              CandidateResultCard(finalVoteCount: finalVoteCount, candidateA: candidateA),
            ],
          ),
        ),
      ),
    );
  }
}

class VotePrecentageIndicator extends StatelessWidget {
  const VotePrecentageIndicator({super.key, required this.finalVoteCount});

  final double finalVoteCount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SizedBox(
            height: size.height * 0.165,
            width: size.height * 0.165,
            child: CircularProgressIndicator(value: 1, strokeWidth: 20, color: Colors.black54, backgroundColor: Colors.black12),
          ),
        ),
        Column(
          children: [
            Text(finalVoteCount.toString(), style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 30)),
            Text("votes", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
          ],
        ),
      ],
    );
  }
}

class CandidateResultCard extends StatelessWidget {
  CandidateResultCard({super.key, required this.finalVoteCount, required this.candidateA});

  double finalVoteCount, candidateA;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.08,
            width: size.height * 0.08,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black26, offset: Offset(-1, 1))],
              image: DecorationImage(image: AssetImage('assets/images/user_icon.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text("John Doe", style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18)),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: LinearProgressIndicator(
                    value: candidateA / finalVoteCount,
                    color: Colors.black54,
                    backgroundColor: Colors.black12,
                    minHeight: 10,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.07,
            width: size.height * 0.07,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withAlpha(15),
              // border: Border.all(color: Colors.grey.shade300, width: 4),
              // boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black26, offset: Offset(-1, 1))],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${((candidateA / finalVoteCount) * 100).floor()}", style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 22)),
                  Text("%", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
