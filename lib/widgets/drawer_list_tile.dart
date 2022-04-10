import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.onPressed,
    this.textStyle = const TextStyle(
      color: primaryColor,
    ),
  }) : super(key: key);

  final String title;
  final TextStyle textStyle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: textStyle,
      ),
      onTap: onPressed,
    );
  }
}
