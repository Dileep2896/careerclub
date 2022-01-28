import 'package:careerclub/screens/home.dart';
import 'package:careerclub/screens/members.dart';
import 'package:careerclub/screens/profile.dart';
import 'package:careerclub/screens/updates.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

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

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      transform: Matrix4.translationValues(
        xOffset,
        yOffset,
        0,
      )..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child:
          // Scaffold(
          //   backgroundColor: Colors.white,
          //   body:
          Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          },
                          icon: const Icon(
                            Icons.menu,
                          ),
                        ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("Welcome"),
                          Text(
                            "Dileep Kumar Sharma",
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Pacifico',
                                fontSize: 16),
                          )
                        ],
                      ),
                      Image.asset(
                        "images/male_avatar.png",
                        width: 60,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Container(
                  color: Colors.grey.shade200,
                  child: _widgetOptions.elementAt(
                    _selectedIndex,
                  ),
                ),
              ),
              bottomNavigationBar: ClipRRect(
                borderRadius: isDrawerOpen
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )
                    : BorderRadius.zero,
                child: BottomNavigationBar(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
