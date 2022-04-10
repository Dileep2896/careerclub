import 'package:careerclub/screens/members_and_about/members.dart';
import 'package:careerclub/screens/members_and_about/profile.dart';
import 'package:careerclub/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

var kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  prefixIcon: const Icon(
    Icons.email,
  ),
  labelText: 'Enter a Value',
  contentPadding: const EdgeInsets.symmetric(
    vertical: 8.0,
  ),
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade400,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);

List<Map> drawerItems = [
  {
    'icon': CupertinoIcons.group,
    'title': 'Members Info',
    'function': MembersInfoScreen.id
  },
  {
    'icon': CupertinoIcons.profile_circled,
    'title': 'Profile',
    'function': ProfileScreen.id,
  },
  {
    'icon': CupertinoIcons.settings,
    'title': 'Settings',
    'function': SettingsScreen.id,
  },
];

Map<int, String> periods = {
  1: "08:30 - 09:30",
  2: "9:30 - 10:30",
  3: "10:50 - 11:50",
  4: "11:50 - 12:50",
  5: "01:40 - 02:35",
  6: "02:35 - 03:30",
  7: "03:30 - 04:25"
};

Map<String, String> teachersData = {
  'teacher1.reva.edu.in': 'teacher 1',
  'teacher2.reva.edu.in': 'teacher 2',
  'teacher3.reva.edu.in': 'teacher 3',
  'teacher4.reva.edu.in': 'teacher 4',
};
