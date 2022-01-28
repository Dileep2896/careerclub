import 'package:careerclub/components/constants.dart';
import 'package:careerclub/screens/home.dart';
import 'package:careerclub/screens/members.dart';
import 'package:careerclub/screens/profile.dart';
import 'package:careerclub/screens/updates.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  static String id = "home_screen";

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const <Widget>[
    HomeScreen(),
    UpdatesScreen(),
    MembersInfoScreen(),
    ProfileScreen(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: darkColor,
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: primaryColor,
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            // backgroundColor: primaryColor,
            icon: Icon(
              Icons.post_add,
            ),
            label: "Posts",
          ),
          BottomNavigationBarItem(
            // backgroundColor: primaryColor,
            icon: Icon(
              Icons.people,
            ),
            label: "Members",
          ),
          BottomNavigationBarItem(
            // backgroundColor: primaryColor,
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTap,
      ),
    );
  }
}
