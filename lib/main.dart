import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //home: LoadingScreen(),
      initialRoute: '/first',
      routes: {
        '/first': (context) => LoadingScreen(),
      },
    );
  }
}
