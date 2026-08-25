import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatefulWidget {
  final Function() onTap;
  final Widget timeStamp;

  const EventCard({super.key, required this.onTap, required this.timeStamp});

  @override
  State<EventCard> createState() => _EventCardState();
}

late Function() onTap;
late Widget timeStamp;

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: size.width * 0.3,
                  child: Center(child: widget.timeStamp),
                ),
              ),
            ),
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
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 12),
                    child: Text('Technology Faculty', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13)),
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
