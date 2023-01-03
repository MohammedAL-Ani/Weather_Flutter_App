import 'package:flutter/material.dart';

class AppIconFormat {
  static Image getWeatherIcon(String icon) {
    String path = 'assets/images/';
    String imageExtension = '.png';
    return Image.asset(
      path + icon + imageExtension,
      width: 70,
      height: 70,
    );
  }

  static Image getWeatherIconSmall(String icon) {
    String path = 'assets/images/';
    String imageExtension = '.png';
    return Image.asset(
      path + icon + imageExtension,
      width: 40,
      height: 40,
    );
  }
}
