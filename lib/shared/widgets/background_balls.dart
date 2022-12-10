import 'dart:math';

import 'package:dev_radar/shared/colors.dart';
import 'package:flutter/material.dart';

class BackgroundBalls extends StatelessWidget {
  const BackgroundBalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        30,
        (index) => const BackgroundBall(),
      ),
    );
  }
}

class BackgroundBall extends StatefulWidget {
  const BackgroundBall({super.key});

  @override
  State<BackgroundBall> createState() => _BackgroundBallState();
}

class _BackgroundBallState extends State<BackgroundBall> with TickerProviderStateMixin {
  late AnimationController yController;
  late AnimationController xController;
  final angle = Random().nextDouble() * pi * 2;

  @override
  void initState() {
    super.initState();

    yController = AnimationController(
      vsync: this,
      duration: Duration(seconds: (7 / sin(angle).abs()).round() + 1),
      value: Random().nextDouble() * 900,
      lowerBound: 0,
      upperBound: 900,
    );

    yController.repeat(reverse: true);

    if (angle > pi / 2 && angle < pi * 3 / 2) {
      yController.reverse().then((value) => yController.repeat(reverse: true));
    }

    xController = AnimationController(
      vsync: this,
      duration: Duration(seconds: (14 / cos(angle).abs()).round() + 1),
      value: Random().nextDouble() * 1800,
      lowerBound: 0,
      upperBound: 1800,
    );

    xController.repeat(reverse: true);

    if (angle > 0 && angle < pi / 2) {
      xController.reverse().then((value) => xController.repeat(reverse: true));
    }

    xController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: yController.value, left: xController.value),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.accent.withAlpha(56),
        ),
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}
