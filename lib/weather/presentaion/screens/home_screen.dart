import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_flutter_app/core/utils/constants.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/components/toolbar_body.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/services/services_locator.dart';
import '../controller/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.cityName}) : super(key: key);
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) => sl<WeatherBloc>()
        ..add(GetWeatherByCountryNameEvent(cityName))
        ..add(GetForecastWeatherByLocationEvent()),
      lazy: false,
      child: const WeatherContent(),
    ));
  }
}

class WeatherContent extends StatelessWidget {
  const WeatherContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currTemp = 30; // current temperature
    int maxTemp = 30; // today max temperature
    int minTemp = 2; // today min temperature

    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: dayBackgroundBoxDecoration(),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ToolbarBody(
                        isOnTop: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.1,
                        ),
                        child: Center(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Text(
                                '$currTemp', //curent temperature
                                style: GoogleFonts.questrial(
                                  color: AppColor.txtMainColor,
                                  // color: currTemp <= 0
                                  //     ? Colors.blue
                                  //     : currTemp > 0 && currTemp <= 15
                                  //         ? Colors.indigo
                                  //         : currTemp > 15 && currTemp < 30
                                  //             ? Colors.deepPurple
                                  //             : Colors.white,
                                  fontSize: size.height * 0.13,
                                ),
                              ),
                              Text("˚C",
                                  style: GoogleFonts.questrial(
                                    color: AppColor.txtMainColor,
                                    fontSize: size.height * 0.02,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Cloudy', // weather
                            style: GoogleFonts.questrial(
                              color: isDarkMode
                                  ? Colors.white54
                                  : AppColor.txtMainColor,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColor.subMainColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.wind_power,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                SizedBox(
                                  width: size.height * 0.01,
                                ),
                                Text("Wind",
                                    style: GoogleFonts.questrial(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: size.height * 0.016,
                                    )),
                                SizedBox(
                                  width: size.height * 0.004,
                                ),
                                Text("26",
                                    style: GoogleFonts.questrial(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: size.height * 0.016,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : AppColor.txtMainColor,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      //TODO: change weather forecast from local to api get
                                      buildForecastToday(
                                        "Now", //hour
                                        currTemp, //temperature
                                        20, //wind (km/h)

                                        FontAwesomeIcons.sun, //weather icon
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "15:00",
                                        1,
                                        10,
                                        FontAwesomeIcons.cloud,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "16:00",
                                        0,
                                        25,
                                        FontAwesomeIcons.cloudRain,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "17:00",
                                        -2,
                                        28,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "18:00",
                                        -5,
                                        13,
                                        FontAwesomeIcons.cloudMoon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "19:00",
                                        -8,
                                        9,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "20:00",
                                        -13,
                                        25,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "21:00",
                                        -14,
                                        12,
                                        FontAwesomeIcons.cloudMoon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "22:00",
                                        -15,
                                        1,
                                        FontAwesomeIcons.moon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "23:00",
                                        -15,
                                        15,
                                        FontAwesomeIcons.moon,
                                        size,
                                        isDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: AppColor.subMainColor,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '7-day forecast',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.white,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: Column(
                                  children: [
                                    //TODO: change weather forecast from local to api get
                                    buildSevenDayForecast(
                                      "Today", //day
                                      minTemp, //min temperature
                                      maxTemp, //max temperature
                                      FontAwesomeIcons.cloud, //weather icon
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Wed",
                                      -5,
                                      5,
                                      FontAwesomeIcons.sun,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Thu",
                                      -2,
                                      7,
                                      FontAwesomeIcons.cloudRain,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Fri",
                                      3,
                                      10,
                                      FontAwesomeIcons.sun,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "San",
                                      5,
                                      12,
                                      FontAwesomeIcons.sun,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Sun",
                                      4,
                                      7,
                                      FontAwesomeIcons.cloud,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Mon",
                                      -2,
                                      1,
                                      FontAwesomeIcons.snowflake,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Tues",
                                      0,
                                      3,
                                      FontAwesomeIcons.cloudRain,
                                      size,
                                      isDarkMode,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildForecastToday(String time, int temp, int wind, IconData weatherIcon,
    size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.all(size.width * 0.025),
    child: Column(
      children: [
        Text(
          time,
          style: GoogleFonts.questrial(
            color: AppColor.txtMainColor,
            fontSize: size.height * 0.02,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.005,
              ),
              child: FaIcon(
                weatherIcon,
                color: AppColor.txtMainColor,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          '$temp˚C',
          style: GoogleFonts.questrial(
            color: AppColor.txtMainColor,
            fontSize: size.height * 0.025,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: FaIcon(
                FontAwesomeIcons.wind,
                color: Colors.grey,
                size: size.height * 0.03,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          '$wind km/h',
          style: GoogleFonts.questrial(
            color: Colors.grey,
            fontSize: size.height * 0.02,
          ),
        ),
      ],
    ),
  );
}

Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
    IconData weatherIcon, size, bool isDarkMode) {
  return Padding(
    padding: EdgeInsets.all(
      size.height * 0.005,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
              ),
              child: Text(
                time,
                style: GoogleFonts.questrial(
                  color: Colors.white,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.25,
              ),
              child: FaIcon(
                weatherIcon,
                color: Colors.white,
                size: size.height * 0.03,
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                ),
                child: Text(
                  '$minTemp˚C',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white38 : Colors.white,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Text(
                  '$maxTemp˚C',
                  style: GoogleFonts.questrial(
                    color: Colors.white,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    ),
  );
}
