import 'package:careerclub/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  static String id = "loading_dialog";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: const SpinKitSquareCircle(
        color: darkColor,
        size: 50.0,
      ),
    );
  }
}
