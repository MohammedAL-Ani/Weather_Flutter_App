import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/state_request.dart';
import '../../controller/weather_bloc.dart';

class ForecastHourlyComponents extends StatelessWidget {
  const ForecastHourlyComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currTemp = 30; // current temperature
    int maxTemp = 30; // today max temperature
    int minTemp = 2;
    bool isBool = false;

    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (previous, current) =>
          previous.getWeatherByCityNameState !=
          current.getWeatherByCityNameState,
      builder: (context, state) {
        print("BlocBuilder ForecastsHourlyContentComponent");
        var forecastHourly = state.getForecastByLocation;
        print(forecastHourly);
        switch (state.getForecastByLocationState) {
          case StateRequest.loading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case StateRequest.loaded:
            return Padding(
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
                      // DateFormat('EEEE').format(DateTime.parse(forecastHourly.dtTxt)
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: forecastHourly.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(size.width * 0.025),
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('EEEE').format(DateTime.parse(
                                        forecastHourly[index].dtTxt)),
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
                                          child: Image.asset(
                                            "assets/images/${forecastHourly[index].icon}.png",
                                            width: 40,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    '${forecastHourly[index].temp}˚C',
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
                                    '${forecastHourly[index].wind} km/h',
                                    style: GoogleFonts.questrial(
                                      color: Colors.grey,
                                      fontSize: size.height * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),

                      // Padding(
                      //   padding: EdgeInsets.all(size.width * 0.005),
                      //   child: SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     child: Row(
                      //       children: [
                      //         buildForecastToday(
                      //           DateFormat('EEEE').format(DateTime.parse(
                      //               state.getForecastByLocation!.dtTxt)), //hour
                      //           state.getForecastByLocation!.temp
                      //               .toInt(), //temperature
                      //           state.getForecastByLocation!
                      //               .description, //wind (km/h)
                      //
                      //           state.getForecastByLocation!.icon, //weather icon
                      //           size,
                      //           isDarkMode,
                      //         ),
                      // buildForecastToday(
                      //   "15:00",
                      //   1,
                      //   10,
                      //   FontAwesomeIcons.cloud,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "16:00",
                      //   0,
                      //   25,
                      //   FontAwesomeIcons.cloudRain,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "17:00",
                      //   -2,
                      //   28,
                      //   FontAwesomeIcons.snowflake,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "18:00",
                      //   -5,
                      //   13,
                      //   FontAwesomeIcons.cloudMoon,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "19:00",
                      //   -8,
                      //   9,
                      //   FontAwesomeIcons.snowflake,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "20:00",
                      //   -13,
                      //   25,
                      //   FontAwesomeIcons.snowflake,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "21:00",
                      //   -14,
                      //   12,
                      //   FontAwesomeIcons.cloudMoon,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "22:00",
                      //   -15,
                      //   1,
                      //   FontAwesomeIcons.moon,
                      //   size,
                      //   isDarkMode,
                      // ),
                      // buildForecastToday(
                      //   "23:00",
                      //   -15,
                      //   15,
                      //   FontAwesomeIcons.moon,
                      //   size,
                      //   isDarkMode,
                      // ),
                      //     ],
                      //   ),
                      // ),
                      // ),
                    ],
                  )),
            );
          case StateRequest.error:
            return SizedBox(
              height: 400,
              child: Center(
                child: Text(state.getWeatherByCityNameMessage),
              ),
            );
        }
      },
    );
  }
}

class ForecastHourly extends StatelessWidget {
  final String time;
  final int temp;
  final String wind;
  final String weatherIcon;
  final Size size;
  final bool isDarkMode;
  const ForecastHourly(
      {Key? key,
      required this.time,
      required this.temp,
      required this.wind,
      required this.weatherIcon,
      required this.isDarkMode,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    "assets/images/$weatherIcon.png",
                    width: 40,
                  )),
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
}

Widget buildForecastToday(String time, int temp, String wind,
    String weatherIcon, size, bool isDarkMode) {
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
                child: Image.asset(
                  "assets/images/$weatherIcon.png",
                  width: 40,
                )),
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
