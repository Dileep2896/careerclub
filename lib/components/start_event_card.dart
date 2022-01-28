import 'package:careerclub/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartEventCard extends StatefulWidget {
  StartEventCard({
    Key? key,
    required this.eventName,
    required this.time,
  }) : super(key: key);

  String eventName;
  int time;

  @override
  State<StartEventCard> createState() => _StartEventCardState();
}

class _StartEventCardState extends State<StartEventCard>
    with TickerProviderStateMixin {
  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: widget.time,
      ),
    );

    controller.reverse(
      from: controller.value == 0 ? 1.0 : controller.value,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        right: 20.0,
        left: 20.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.eventName,
                style: const TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Start In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
