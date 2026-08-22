import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/vote/vote_screen.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VoteScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        height: size.height * 0.25,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage('assets/images/banner.png'), fit: BoxFit.fitWidth),
          boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black26, offset: Offset(1, 1))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.075,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Colors.white70, Colors.white10],
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('Sports Club Election 2026-27', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 12),
                    child: Text('Technology Faculty', style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
