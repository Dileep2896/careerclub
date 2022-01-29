import 'package:careerclub/screens/event_past.dart';
import 'package:careerclub/screens/event_registered.dart';
import 'package:careerclub/screens/event_upcoming.dart';
import 'package:careerclub/utils/user_actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    EventRegisteredScreen(),
    EventUpcomingScreen(),
    EventPastScreen(),
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
            onVerticalDragStart: (DragStartDetails details) {
              _drawerOpen();
            },
            onTap: () {
              _drawerClose();
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: isDrawerOpen
                    ? BorderRadius.circular(40)
                    : BorderRadius.circular(0),
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
                                    _drawerClose();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    _drawerOpen();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                  ),
                                ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Welcome"),
                                  Text(
                                    documentSnapshot?.get("fName"),
                                    style: const TextStyle(
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
                                FontAwesomeIcons.calendarCheck,
                                size: 18,
                              ),
                              label: "Registered",
                            ),
                            BottomNavigationBarItem(
                              // backgroundColor: primaryColor,
                              icon: Icon(
                                FontAwesomeIcons.calendarPlus,
                                size: 18,
                              ),
                              label: "Upcoming",
                            ),
                            BottomNavigationBarItem(
                              // backgroundColor: primaryColor,
                              icon: Icon(
                                FontAwesomeIcons.calendarMinus,
                                size: 18,
                              ),
                              label: "Past",
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
            ),
          );
  }
}
