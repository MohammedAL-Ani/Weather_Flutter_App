import 'package:flutter/material.dart';
import 'package:weather_flutter_app/core/services/services_locator.dart';

import 'package:weather_flutter_app/weather/presentaion/screens/begin_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const BeginScreen(),
    );
  }
}
