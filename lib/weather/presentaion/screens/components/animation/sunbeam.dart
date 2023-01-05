import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SunAnimation extends StatefulWidget {
  const SunAnimation({super.key});

  @override
  SunAnimationState createState() => SunAnimationState();
}

class SunAnimationState extends State<SunAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
      transform: Matrix4.rotationZ(_controller.value * 2 * pi),
      child: SvgPicture.asset(
        'assets/svg/sun.svg',
        width: 100,
        height: 100,
      ),
    );
  }
}
