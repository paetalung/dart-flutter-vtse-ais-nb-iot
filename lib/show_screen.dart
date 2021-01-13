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

  // // Show Weather Section Variable
  // var ws;
  // var wd;
  // var pw;
  // var vis;
  // var cl;

  @override
  void initState() {
    super.initState();

    updateUI(widget.showWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
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
      double tBuff = weatherData['Sensor']['t'];
      t = tBuff.toString();
      double tdBuff = weatherData['Sensor']['dp'];
      td = tdBuff.toString();
      double hBuff = weatherData['Sensor']['h'];
      h = hBuff.toString();
      double qnhBuff = weatherData['Sensor']['QNH'];
      qnh = qnhBuff.toString();
      double qfeBuff = weatherData['Sensor']['QFE'];
      qfe = qfeBuff.toString();
      double qfeInBuff = weatherData['Sensor']['QFE_in'];
      qfeIn = qfeInBuff.toString();
      double vBuff = weatherData['Sensor']['B_V'];
      v = vBuff.toString();
      int bBuff = weatherData['Sensor']['B_L'].truncate();
      b = bBuff.toString();

      // if (windData == null) {
      //   ws = 0.0;
      //   wd = '-';
      //   pw = 'nsw';
      //   vis = 0.0;
      //   cl = 0.0;
      //   return;
      // }
      // double wsBuff = windData['wind']['speed'];
      // ws = wsBuff.toString();
      // //double wdBuff = windData['wind']['deg'];
      // wd = windData['wind']['deg'];
      // pw = windData['weather'][0]['description'];
      // int visBuff = windData['visibility'];
      // vis = visBuff.toString();
      // int clBuff = windData['clouds']['all'];
      // cl = clBuff.toString();
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
              // Row(
              //   children: [
              //     buildPad(
              //         color: Colors.blueGrey[100],
              //         preFix: 'Wd',
              //         unit: '°',
              //         weatherValue: wd),
              //     buildPad(
              //         color: Colors.blueGrey[100],
              //         preFix: 'Ws',
              //         unit: 'KT',
              //         weatherValue: ws),
              //   ],
              // ),
              // buildPad(
              //     color: Colors.blueGrey[100],
              //     preFix: 'PW',
              //     unit: '',
              //     weatherValue: pw),
              // buildPad(
              //     color: Colors.blueGrey[100],
              //     preFix: 'Vis',
              //     unit: 'm',
              //     weatherValue: vis),
              // buildPad(
              //     color: Colors.blueGrey[100],
              //     preFix: 'Clouds',
              //     unit: '%',
              //     weatherValue: cl),
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
              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'QFE',
                  unit: 'hPa',
                  weatherValue: qfe),
              buildPad(
                  color: Colors.blueGrey[100],
                  preFix: 'QFE \'',
                  unit: 'inHg',
                  weatherValue: qfeIn),
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
