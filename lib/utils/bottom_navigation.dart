import 'package:careerclub/database/db.dart';
import 'package:careerclub/models/event_model.dart';
import 'package:careerclub/models/user_data_model.dart';
import 'package:careerclub/screens/event_fav/event_fav.dart';
import 'package:careerclub/screens/event_registered/event_registered.dart';
import 'package:careerclub/screens/event_upcoming/event_upcoming.dart';
import 'package:careerclub/screens/members_and_about/members.dart';
import 'package:careerclub/screens/user/user_profile.dart';
import 'package:careerclub/utils/desicion_tree.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/colors.dart';
import '../widgets/drawer_list_tile.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  static String id = "home_screen";

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    StreamProvider<List<EventModel>>.value(
      value: DataBase().upcomingEvents(
        FirebaseAuth.instance.currentUser!.uid,
      ),
      initialData: const [],
      child: const EventUpcomingScreen(),
    ),
    StreamProvider<List<EventModel>>.value(
      value: DataBase().registeredEvents(
        FirebaseAuth.instance.currentUser!.uid,
      ),
      initialData: const [],
      child: const EventRegisteredScreen(),
    ),
    const FavEventScreen(),
  ];

  final List<Color> _navColors = const <Color>[
    Colors.blueAccent,
    darkColor,
    Colors.pinkAccent
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserDataModel userData = Provider.of<UserDataModel>(context);
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: darkColor),
        toolbarHeight: 100,
        backgroundColor: secondaryColor,
        elevation: 0,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  color: darkColor,
                ),
              ),
              userData.fName == null
                  ? Shimmer.fromColors(
                      baseColor: Colors.black26,
                      highlightColor: Colors.black12,
                      child: Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  : Text(
                      userData.fName!,
                      style: const TextStyle(
                        color: darkColor,
                        fontFamily: 'Pacifico',
                        fontSize: 16,
                      ),
                    ),
            ],
          ),
          Image.asset(
            "images/male_avatar.png",
            width: 60,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: darkColor,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Image.asset("images/logo.png"),
              ),
            ),
            DrawerListTile(
              onPressed: () {
                Navigator.pushNamed(context, MembersInfoScreen.id);
              },
              title: "Club Members",
            ),
            DrawerListTile(
              onPressed: () {},
              title: "About Us",
            ),
            DrawerListTile(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(
                      userData: userData,
                    ),
                  ),
                );
              },
              title: "Profile",
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 30),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, DesicionTree.id);
                    },
                    child: const Text(
                      "Log out",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
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
    );
  }
}
