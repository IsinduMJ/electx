import 'package:electx_new/views/auth/signup_screen.dart';
import 'package:electx_new/views/vote/vote_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static final List<Widget> _widgetOptions = <Widget>[OngoingEvents(), OngoingEvents(), OngoingEvents()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Events", style: GoogleFonts.poppins()),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          },
        ),
      ),
      drawer: Drawer(
        width: size.width * 0.7,
        backgroundColor: Colors.white,
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            child: Text(
              "Logout",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(icon: Icons.history, text: 'Recent'),
                GButton(icon: Icons.run_circle_outlined, text: 'Ongoing'),
                GButton(icon: Icons.next_plan_outlined, text: 'Upcuming'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OngoingEvents extends StatelessWidget {
  const OngoingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        EventCard(size: size),
        EventCard(size: size),
        EventCard(size: size),
        EventCard(size: size),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
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
