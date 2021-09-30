import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  ShowScreen({this.showWeather, this.showWind});

  final dynamic showWeather;
  final dynamic showWind;

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  // Show Weather Section Variable
  var t;
  var td;
  var h;
  var qnh;
  var qfe;
  var qfeIn;
  var v;
  var b;

  // debug
  // Show Weather Section Variable
  var ws;
  var wd;
  var pw;
  var vis;
  var cl;

  @override
  void initState() {
    super.initState();

    updateUI(widget.showWeather, widget.showWind);
  }

  void updateUI(dynamic weatherData, dynamic windData) {
    setState(() {
      // debug
      //print(weatherData);
      if (weatherData == null) {
        t = '0.0';
        td = '0.0';
        h = '0.0';
        qnh = '0.0';
        qfe = '0.0';
        qfeIn = '0.0';
        v = '0.0';
        b = '0.0';
        return;
      }
      double tBuff = weatherData['Sensor']['t'] is int
          ? (weatherData['Sensor']['t'] as int).toDouble()
          : weatherData['Sensor']['t'];
      t = tBuff.toString();
      double tdBuff = weatherData['Sensor']['dp'] is int
          ? (weatherData['Sensor']['dp'] as int).toDouble()
          : weatherData['Sensor']['dp'];
      td = tdBuff.toString();
      double hBuff = weatherData['Sensor']['h'] is int
          ? (weatherData['Sensor']['h'] as int).toDouble()
          : weatherData['Sensor']['h'];
      h = hBuff.toString();
      double qnhBuff = weatherData['Sensor']['QNH'] is int
          ? (weatherData['Sensor']['QNH'] as int).toDouble()
          : weatherData['Sensor']['QNH'];
      qnh = qnhBuff.toString();
      double qfeBuff = weatherData['Sensor']['QFE'] is int
          ? (weatherData['Sensor']['QFE'] as int).toDouble()
          : weatherData['Sensor']['QFE'];
      qfe = qfeBuff.toString();
      double qfeInBuff = weatherData['Sensor']['QFE_in'] is int
          ? (weatherData['Sensor']['QFE_in'] as int).toDouble()
          : weatherData['Sensor']['QFE_in'];
      qfeIn = qfeInBuff.toString();
      double vBuff = weatherData['Sensor']['B_V'] is int
          ? (weatherData['Sensor']['B_V'] as int).toDouble()
          : weatherData['Sensor']['B_V'];
      v = vBuff.toString();
      double bBuff = weatherData['Sensor']['B_L'] is int
          ? (weatherData['Sensor']['B_L'] as int).toDouble()
          : weatherData['Sensor']['B_L'];
      b = bBuff.toString();

      // debug
      //print(windData);
      if (windData == null) {
        ws = '0.0';
        wd = '0.0';
        pw = '0.0';
        vis = '0.0';
        cl = '0.0';
        return;
      }

      double wsBuff = windData['wind']['speed'] is int
          ? (windData['wind']['speed'] as int).toDouble()
          : windData['wind']['speed'];
      ws = wsBuff.toString();

      int wdBuff = windData['wind']['deg'];
      wd = wdBuff.toString();

      pw = windData['weather'][0]['description'].toString();

      int visBuff = windData['visibility'];
      vis = visBuff.toString();

      int clBuff = windData['clouds']['all'];
      cl = clBuff.toString();
    });
  }

  Expanded buildPad(
      {Color color, String preFix, String unit, String weatherValue}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.blueGrey[300])),
          color: color,
          padding: EdgeInsets.all(2.0),
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
          child: Text('$preFix : $weatherValue $unit',
              style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(child: Text('VTSE OBS')),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // debug
              Row(
                children: [
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'Wd',
                      unit: '°',
                      weatherValue: wd),
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'Ws',
                      unit: 'KT',
                      weatherValue: ws),
                ],
              ),
              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'PW',
                  unit: '',
                  weatherValue: pw),

              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'Vis',
                  unit: 'm',
                  weatherValue: vis),
              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'Cloud',
                  unit: '%',
                  weatherValue: cl),

              Row(
                children: [
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'T',
                      unit: '°C',
                      weatherValue: t),
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'Td',
                      unit: '°C',
                      weatherValue: td),
                ],
              ),

              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'H',
                  unit: '%',
                  weatherValue: h),
              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'QNH',
                  unit: 'hPa',
                  weatherValue: qnh),

              Row(
                children: [
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'qfe',
                      unit: 'hPa',
                      weatherValue: qfe),
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'qfe\'',
                      unit: 'inHg',
                      weatherValue: qfeIn),
                ],
              ),

              Row(
                children: [
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'VOLT',
                      unit: 'V',
                      weatherValue: v),
                  buildPad(
                      color: Colors.blueGrey[100],
                      preFix: 'BATT',
                      unit: '%',
                      weatherValue: b),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
