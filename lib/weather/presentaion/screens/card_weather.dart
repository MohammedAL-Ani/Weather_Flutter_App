import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherBox(),
    );
  }
}

Widget weatherBox(
    // Weather _weather
    ) {
  return Center(
    child: Stack(children: [
      Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        height: 160.0,
        decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      ClipPath(
          clipper: Clipper(),
          child: Container(
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(15.0),
              height: 160.0,
              decoration: BoxDecoration(
                  color: Colors.indigoAccent[400],
                  borderRadius: BorderRadius.all(Radius.circular(20))))),
      Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    // getWeatherIcon(_weather.icon),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          "Baghdad",
                          // "${_weather.description.capitalizeFirstOfEach}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        )),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Text(
                          "H:4666 L:98998",
                          // "H:${_weather.high.toInt()}° L:${_weather.low.toInt()}°",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Colors.white),
                        )),
                  ])),
              Column(children: <Widget>[
                Container(
                    child: Text(
                  "11.42°",
                  // "${_weather.temp.toInt()}"°",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white),
                )),
                Container(
                    margin: const EdgeInsets.all(0),
                    child: Text(
                      "Feels like  66",
                      // "${_weather.feelsLike.toInt()}°",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.white),
                    )),
              ])
            ],
          ))
    ]),
  );
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 20);

    path.quadraticBezierTo((size.width / 6) * 1, (size.height / 2) + 15,
        (size.width / 3) * 1, size.height - 30);
    path.quadraticBezierTo((size.width / 2) * 1, (size.height + 0),
        (size.width / 3) * 2, (size.height / 4) * 3);
    path.quadraticBezierTo((size.width / 6) * 5, (size.height / 2) - 20,
        size.width, size.height - 60);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}
