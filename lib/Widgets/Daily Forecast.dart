import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';







class DailyForecastPage extends StatefulWidget {
  final String lat;
  final String long;
  final String searchCity;
  final String forecastday;
  final String day;
  final String conditions;
  final double max;
  final double min;
  final double prob;
  DailyForecastPage({Key key,this.lat, this.long, this.searchCity, this.forecastday, this.day,this.conditions, this.max, this.min, this.prob}): super (key:key);
  @override
  _DailyForecastPageState createState() => _DailyForecastPageState();
}

class _DailyForecastPageState extends State<DailyForecastPage> {


  

  Future getForecastDay() async {
    http.Response response = await http.get(
        "");
    var results = jsonDecode(response.body);
    setState(() {
      
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.forecastday),

          ],
        ),
      ),
    );
  }
}
