import 'package:careerclub/components/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            Colors.grey.shade100,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20.0,
              bottom: 20.0,
            ),
            child: Image.asset(
              'images/logo.png',
              height: 100,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 10.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Career Club",
                      style: TextStyle(
                        color: darkColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "We @Career_Club try to bring change in students",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
