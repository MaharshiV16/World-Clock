import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; //the time in the location
  String flag; //url of the asset file
  String url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      var link = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http.get(link);
      Map data = jsonDecode(response.body);

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
    } //set time to a variable
    catch (e) {
      print("Error Loading time");
      print("$e");
    }
  }
}
