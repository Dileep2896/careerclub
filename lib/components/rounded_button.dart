import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RoundedButton({
    this.color = Colors.black,
    this.title = "None",
    this.titleColor = Colors.black,
    required this.onPressed,
  });

  final Color color;
  final Color titleColor;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: MediaQuery.of(context).size.width / 1.3,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
