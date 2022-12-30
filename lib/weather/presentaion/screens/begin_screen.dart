import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_flutter_app/weather/presentaion/screens/home_screen.dart';

import '../../../core/utils/constants.dart';

class BeginScreen extends StatelessWidget {
  const BeginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: beginBackgroundBoxDecoration(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.12),
              child: const Image(
                image: AssetImage(
                  'assets/images/cloudy.png',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: Text("Weather ",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: AppColor.txtMainColor)),
            ),
            Text("Forecasts",
                style: GoogleFonts.roboto(
                    fontSize: 44, color: AppColor.subMainColor2)),
            Padding(
              padding: EdgeInsets.all(size.height * 0.05),
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.height * 0.01)),
                    color: AppColor.subMainColor2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const HomeScreen(cityName: 'baghdad'),
                        ),
                      );
                    },
                    child: Text(
                      "get started",
                      style: GoogleFonts.roboto(
                          color: AppColor.txtMainColor, fontSize: 22),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
