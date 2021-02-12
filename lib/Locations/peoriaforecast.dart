import 'package:WeatherApp/Locations/peoria.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeoriaForecast extends StatefulWidget {
  @override
  _PeoriaForecastState createState() => _PeoriaForecastState();
}

class _PeoriaForecastState extends State<PeoriaForecast> {

  var day1min;
  var day1max;
  var day2;
  var day3;
  var day4;
  var day5;
  var day6;
  var day7;

  Future getForecast() async {
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=40.6936&lon=-89.5890&units=imperial&exclude=currently,minutely,hourly&appid=cede032f308595f7c8c256d0de8e31a6");
    var results = jsonDecode(response.body);
    setState(() {
      this.day1min = results['daily'][0]['temp']['min'];
      this.day1max = results['daily'][0]['temp']['max'];
      this.day2 = results['daily'][1]['temp']['min'];
      this.day3 = results['daily'][2]['temp']['min'];
      this.day4 = results['daily'][3]['temp']['min'];
      this.day5 = results['daily'][4]['temp']['min'];
      this.day6 = results['daily'][5]['temp']['min'];
      this.day7 = results['daily'][6]['temp']['min'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text(
              day1min != null ? day1min.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day1max != null ? day1max.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day2 != null ? day2.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day3 != null ? day3.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day4 != null ? day4.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day5 != null ? day5.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day6 != null ? day6.toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            child: Text(
              day7 != null ? day7 .toString(): "Loading",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
