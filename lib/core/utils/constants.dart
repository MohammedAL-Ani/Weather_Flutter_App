import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColor {
  static const Color subMainColor = Color(0xff5986bb);
  static const Color txtMainColor = Color(0xfff8f7fb);
  static const Color txtMainColor2 = Color(0xff2a296c);
  static const Color subMainColor2 = Color(0xfffeb927);
  static const Color witheColor2 = Color(0xffffffff);
  static const Color gradiantColor1 = Color(0xff0b2367);
  static const Color gradiantColor2 = Color(0xff3772b2);
  static const Color gradiantColor3 = Color(0xff2f3f64);
  static const Color gradiantColor4 = Color(0xff496585);
  static const Color gradiantColor5 = Color(0xff5daae9);
  static const Color gradiantColor6 = Color(0xff4982f2);
  static const Color beginColor = Color(0xff669bef);
  static const Color beginColor2 = Color(0xff1453e6);
}

BoxDecoration nightBackgroundBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      // begin: Alignment(-0.7, 12),
      // end: Alignment(1, -2),
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.gradiantColor1,
        AppColor.gradiantColor2,
      ],
    ),
  );
}

BoxDecoration dayBackgroundBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.gradiantColor5,
        AppColor.gradiantColor6,
      ],
    ),
  );
}

BoxDecoration sunsetBackgroundBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.gradiantColor3,
        AppColor.gradiantColor4,
      ],
    ),
  );
}

BoxDecoration beginBackgroundBoxDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        AppColor.beginColor,
        AppColor.beginColor2,
      ],
    ),
  );
}
