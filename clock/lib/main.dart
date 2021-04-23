import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        canvasColor: Colors.grey[900],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        'home': (context) => Home(),
        'location': (context) => ChooseLocation(),
      },
    );
  }
}
