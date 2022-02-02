import 'package:careerclub/screens/event_fav.dart';
import 'package:careerclub/screens/event_registered.dart';
import 'package:careerclub/screens/event_upcoming.dart';
import 'package:careerclub/utils/user_actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../widgets/loading_dialog.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  static String id = "home_screen";

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const <Widget>[
    EventUpcomingScreen(),
    EventRegisteredScreen(),
    FavEventScreen(),
  ];

  final List<Color> _navColors = const <Color>[
    Colors.blueAccent,
    darkColor,
    Colors.pinkAccent
  ];

  DocumentSnapshot? documentSnapshot;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future<DocumentSnapshot<Object?>?> documentSnapshot = getUserData();
    documentSnapshot.then(
      (value) => {
        if (value != null)
          {
            setState(() {
              this.documentSnapshot = value;
              _isLoading = false;
            })
          }
        else
          {
            setState(() {
              _isLoading = true;
            })
          }
      },
    );
    onItemTap(1);
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _drawerOpen() {
    setState(() {
      xOffset = 230;
      yOffset = 150;
      scaleFactor = 0.7;
      isDrawerOpen = true;
    });
  }

  void _drawerClose() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingDialog()
        : GestureDetector(
            onTap: () {
              _drawerClose();
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: isDrawerOpen
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
              ),
              transform: Matrix4.translationValues(
                xOffset,
                yOffset,
                0,
              )..scale(scaleFactor),
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 250),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: secondaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isDrawerOpen
                              ? IconButton(
                                  onPressed: () {
                                    _drawerClose();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: darkColor,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    _drawerOpen();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                    color: darkColor,
                                  ),
                                ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Welcome",
                                    style: TextStyle(
                                      color: darkColor,
                                    ),
                                  ),
                                  Text(
                                    documentSnapshot?.get("fName"),
                                    style: const TextStyle(
                                      color: darkColor,
                                      fontFamily: 'Pacifico',
                                      fontSize: 16,
                                    ),
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
                          color: primaryColor,
                          child: _widgetOptions.elementAt(
                            _selectedIndex,
                          ),
                        ),
                      ),
                      bottomNavigationBar: CurvedNavigationBar(
                        color: darkColor,
                        height: 70,
                        backgroundColor: primaryColor,
                        buttonBackgroundColor: _navColors[_selectedIndex],
                        items: const [
                          Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.check,
                            size: 30,
                            color: Colors.white,
                          ),
                          Icon(
                            CupertinoIcons.heart_fill,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                        onTap: onItemTap,
                        index: _selectedIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
