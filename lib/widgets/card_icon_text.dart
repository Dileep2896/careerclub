import 'package:careerclub/styles/colors.dart';
import 'package:flutter/material.dart';

class CardIconText extends StatelessWidget {
  const CardIconText({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor = primaryColor,
    this.textColor = Colors.white,
    this.iconSize = 18,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final String title;
  final IconData icon;

  final Color textColor;
  final Color iconColor;

  final double iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
