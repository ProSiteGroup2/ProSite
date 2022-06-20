import 'package:flutter/material.dart';
import 'package:group2/pages/user_profile.dart';
// import 'package:group2/pages/labour_activities.dart';
import 'package:group2/src/ui/customer_activities.dart';
import 'package:group2/src/ui/home_screen.dart';
import 'package:group2/pages/notifications.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currindex = 0;
  final screens = [HomeScreen(), CActivity(), Notifications(), User_Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currindex,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        child: BottomNavigationBar(
          currentIndex: currindex,
          onTap: (index) => setState(() => currindex = index),
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Color(0xFF125488),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Activities',
              backgroundColor: Color(0xFF125488),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_rounded),
              label: 'Notifications',
              backgroundColor: Color(0xFF125488),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              backgroundColor: Color(0xFF125488),
            ),
          ],
          selectedItemColor: Colors.cyanAccent[100],
          iconSize: 35.0,
        ),
      ),
    );
  }
}
