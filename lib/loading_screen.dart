import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'networking.dart';
import 'show_screen.dart';

const MagellanURL = 'xxx';
const OpenWeatherMapURL = 'xxx';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    NetworkHelper networkHelper = NetworkHelper(MagellanURL);
    var weatherData = await networkHelper.getData();
    //print(weatherData);
    NetworkHelper networkHelper2 = NetworkHelper(OpenWeatherMapURL);
    var windData = await networkHelper2.getData();
    //print(windData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShowScreen(showWeather: weatherData, showWind: windData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.blueGrey[600],
          size: 100.0,
        ),
      ),
    );
  }
}
