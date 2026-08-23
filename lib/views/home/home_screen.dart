import 'package:electx_new/components/timestamp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../components/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static final List<Widget> _widgetOptions = <Widget>[RecentEvents(), OngoingEvents(), UpcomingEvents()];
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
            onTap: () => Navigator.pushNamed(context, '/signup'),
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
    return Column(
      children: [
        EventCard(onTap: () => Navigator.pushNamed(context, '/vote'), timeStamp: SizedBox()),
        EventCard(onTap: () => Navigator.pushNamed(context, '/vote'), timeStamp: SizedBox()),
        EventCard(onTap: () => Navigator.pushNamed(context, '/vote'), timeStamp: SizedBox()),
        EventCard(onTap: () => Navigator.pushNamed(context, '/vote'), timeStamp: SizedBox()),
      ],
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventCard(onTap: () {}, timeStamp: Timestamp()),
        EventCard(onTap: () {}, timeStamp: Timestamp()),
        EventCard(onTap: () {}, timeStamp: Timestamp()),
        EventCard(onTap: () {}, timeStamp: Timestamp()),
      ],
    );
  }
}

class RecentEvents extends StatelessWidget {
  const RecentEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventCard(onTap: () {}, timeStamp: SizedBox()),
        EventCard(onTap: () {}, timeStamp: SizedBox()),
        EventCard(onTap: () {}, timeStamp: SizedBox()),
        EventCard(onTap: () {}, timeStamp: SizedBox()),
      ],
    );
  }
}
