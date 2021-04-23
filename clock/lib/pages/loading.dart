import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoadingScreen> {
  void setUpWorldTime() async {
    try {
      WorldTime instance = WorldTime(
        location: 'New York',
        flag: 'usa.png',
        url: 'America/New_York',
      );
      await instance.getTime();
      print('ho gaya');
      Navigator.pushReplacementNamed(
        context,
        'home',
        arguments: {
          "location": instance.location,
          "flag": instance.flag,
          "time": instance.time,
        },
      );
    } catch (e) {
      print("error aayi");
      print("$e");
    }
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SpinKitCubeGrid(
                color: Colors.amber,
                size: 60,
              ),
              Text(
                "Loading...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.amber[400],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
