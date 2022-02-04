import 'package:careerclub/screens/members.dart';
import 'package:careerclub/screens/profile.dart';
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

List<Map> tempCardInfo = [];
