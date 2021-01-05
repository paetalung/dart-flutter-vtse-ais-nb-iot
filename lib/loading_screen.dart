import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'networking.dart';
import 'show_screen.dart';

const MagellanURL = '';
const OpenWeatherMapURL = '';

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
    //getWind();
  }

  void getWeather() async {
    NetworkHelper networkHelper = NetworkHelper(MagellanURL);
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShowScreen(
        showWeather: weatherData,
      );
    }));
  }

  // void getWind() async {
  //   NetworkHelper networkHelper = NetworkHelper(OpenWeatherMapURL);
  //   var windData = await networkHelper.getData();
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return ShowScreen(
  //       showWind: windData,
  //     );
  //   }));
  // }

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
