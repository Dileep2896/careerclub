// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../styles/colors.dart';

// ignore: must_be_immutable
class MembersCard extends StatelessWidget {
  MembersCard({
    Key? key,
    required this.name,
    this.title = 'Unknown',
    required this.onPressed,
    required this.image,
  }) : super(key: key);

  String name;
  String title;
  Function onPressed;
  String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      splashColor: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: const BoxDecoration(
            color: darkColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: darkColor,
                  radius: 20,
                  backgroundImage: AssetImage(
                    image,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
