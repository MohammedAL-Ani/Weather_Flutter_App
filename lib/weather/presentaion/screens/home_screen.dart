import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:weather_flutter_app/core/utils/constants.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/components/forecast_hourly.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/components/forecast_weekday.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/components/toolbar_body.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/state_request.dart';
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
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) =>
            previous.getWeatherByCityNameState !=
            current.getWeatherByCityNameState,
        builder: (context, state) {
          switch (state.getWeatherByCityNameState) {
            case StateRequest.loading:
              return const SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case StateRequest.loaded:
              return Center(
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
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          children: [
                                            Text(
                                              '${state.getWeatherByCityName!.temp.toInt()}', //curent temperature
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.25),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.height * 0.005,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.getWeatherByCityName!
                                                .description, // weather
                                            style: GoogleFonts.questrial(
                                              color: isDarkMode
                                                  ? Colors.white54
                                                  : AppColor.txtMainColor,
                                              fontSize: size.height * 0.03,
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/images/${state.getWeatherByCityName!.icon}.png",
                                            width: 40,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.height * 0.03,
                                        bottom: size.height * 0.01,
                                      ),
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: AppColor.subMainColor),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.wind_power,
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: size.height * 0.01,
                                              ),
                                              Text("Wind",
                                                  style: GoogleFonts.questrial(
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    fontSize:
                                                        size.height * 0.016,
                                                  )),
                                              SizedBox(
                                                width: size.height * 0.004,
                                              ),
                                              Text(
                                                  "${state.getWeatherByCityName!.windDeg}",
                                                  style: GoogleFonts.questrial(
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    fontSize:
                                                        size.height * 0.016,
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
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text(
                                                "Wind",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color:
                                                        AppColor.txtMainColor),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                "${state.getWeatherByCityName!.wind} km/h",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                    color:
                                                        AppColor.subMainColor2),
                                              )
                                            ],
                                          )),
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text(
                                                "Humidity",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color:
                                                        AppColor.txtMainColor),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                "${state.getWeatherByCityName!.humidity.toInt()}%",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                    color:
                                                        AppColor.subMainColor2),
                                              )
                                            ],
                                          )),
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text(
                                                "Pressure",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color:
                                                        AppColor.txtMainColor),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                "${state.getWeatherByCityName!.pressure} hPa",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                    color:
                                                        AppColor.subMainColor2),
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.05,
                                      ),
                                      child: Align(
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
                                    ),
                                    const ForecastHourlyComponents(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const ForecastWeekDay(),
                                  ]),
                            ),
                          ],
                        ),
                      )));
            case StateRequest.error:
              return SizedBox(
                height: 400,
                child: Center(
                  child: Text(state.getWeatherByCityNameMessage),
                ),
              );
          }
        });
  }
}
