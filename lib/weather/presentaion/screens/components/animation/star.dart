import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/home_screen.dart';

class StarAnimation extends StatefulWidget {
  final WeatherContent weatherContent;
  const StarAnimation({Key? key, required this.weatherContent})
      : super(key: key);

  @override
  StarAnimationState createState() => StarAnimationState();
}

class StarAnimationState extends State<StarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Add 50 randomly positioned star widgets to the stack
          for (int i = 0; i < 50; i++)
            Positioned(
              left: Random().nextDouble() * MediaQuery.of(context).size.width,
              top: Random().nextDouble() * MediaQuery.of(context).size.height,
              child: AnimatedContainer(
                duration: const Duration(seconds: 5),
                curve: Curves.linear,
                width: 6,
                height: 6,

                transform: Matrix4.rotationY(_controller.value * 2 * pi),
                child: SvgPicture.asset(
                  'assets/svg/star.svg',
                  width: 100,
                  height: 100,
                ),
                // opacity:
                // _controller.value,
              ),
            ),
          widget.weatherContent
        ],
      ),
    );
  }
}
