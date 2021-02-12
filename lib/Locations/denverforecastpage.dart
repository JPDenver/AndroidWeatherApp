import 'package:WeatherApp/Widgets/7day.dart';
import 'package:WeatherApp/Widgets/New7dayForecast.dart';
import 'package:WeatherApp/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

GetDay() {
  var date = DateTime.now();
  print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
  var today = DateFormat('EEEE').format(date);
  print(today);// prints Tuesday
}


class DenverForecastPage extends StatefulWidget {
  @override
  _DenverForecastPageState createState() => _DenverForecastPageState();
}

class _DenverForecastPageState extends State<DenverForecastPage> {

  var day1min; var day1max; var day1conditions; var day1prob;
  var day1forecastday = "day1";

  var day2min;var day2max;var day2conditions;var day2prob;

  var day3min;var day3max;var day3conditions;var day3prob;

  var day4min;var day4max;var day4conditions;var day4prob;

  var day5min;var day5max;var day5conditions;var day5prob;

  var day6min;var day6max;var day6conditions;var day6prob;

  var day7min;var day7max;var day7conditions;var day7prob;




  Future getForecast() async {
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=39.7392&lon=-104.9903&units=imperial&appid=cede032f308595f7c8c256d0de8e31a6");
    var results = jsonDecode(response.body);
    setState(() {
      this.day1min = results['daily'][0]['temp']['min'];
      this.day1max = results['daily'][0]['temp']['max'];
      this.day1conditions = results['daily'][0]['weather'][0]['description'];
      this.day1prob = results['daily'][0]['pop']*100;

      this.day2min = results['daily'][1]['temp']['min'];
      this.day2max = results['daily'][1]['temp']['max'];
      this.day2conditions = results['daily'][1]['weather'][0]['description'];
      this.day2prob = results['daily'][1]['pop']*100;

      this.day3min = results['daily'][2]['temp']['min'];
      this.day3max = results['daily'][2]['temp']['max'];
      this.day3conditions = results['daily'][2]['weather'][0]['description'];
      this.day3prob = results['daily'][2]['pop']*100;

      this.day4min = results['daily'][3]['temp']['min'];
      this.day4max = results['daily'][3]['temp']['max'];
      this.day4conditions = results['daily'][3]['weather'][0]['description'];
      this.day4prob = results['daily'][3]['pop']*100;

      this.day5min = results['daily'][4]['temp']['min'];
      this.day5max = results['daily'][4]['temp']['max'];
      this.day5conditions = results['daily'][0]['weather'][0]['description'];
      this.day5prob = results['daily'][0]['pop']*100;

      this.day6min = results['daily'][5]['temp']['min'];
      this.day6max = results['daily'][5]['temp']['max'];
      this.day6conditions = results['daily'][5]['weather'][0]['description'];
      this.day6prob = results['daily'][5]['pop']*100;

      this.day7min = results['daily'][6]['temp']['min'];
      this.day7max = results['daily'][6]['temp']['max'];
      this.day7conditions = results['daily'][6]['weather'][0]['description'];
      this.day7prob = results['daily'][6]['pop']*100;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getForecast();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var today = DateFormat('EEEE').format(date);
    dynamic week = [];
    if(today == 'Monday'){
      // print('yes');
      week = ["Tue","Wed","Thu","Fri","Sat","Sun","Mon"];
      // print(week);
    } else if(today == 'Tuesday'){
      week = ["Wed","Thu","Fri","Sat","Sun","Mon","Tue",];
    } else if(today == 'Wednesday'){
      week = ["Thu","Fri","Sat","Sun","Mon","Tue","Wed",];
    } else if(today == 'Thursday'){
      week = ["Fri","Sat","Sun","Mon","Tue","Wed","Thu",];
    } else if(today == 'Friday'){
      week = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri",];
    } else if(today == 'Saturday'){
      week = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat",];
    } else if(today == 'Sunday'){
      week = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun",];
    }



    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/denver-skyline.png'),
                    fit: BoxFit.cover,
                  )
              ),
              child: CityName("Denver, Colorado")
            ),
            Container(
              height: 10,
              color: Colors.blue[600],
            ),
            sevenDayTitle(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30,0,30,30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      sevenDayLabels(),
                      forecastDivider(),
                      ForecastColumn2(forecastday: day1forecastday,day: today, conditions: day1conditions, max: day1max, min: day1min, prob: day1prob,),
                      // forecastColumn(week[0],day1conditions, day1max, day1min, day1prob),
                      forecastDivider(),
                      forecastColumn(week[1],day2conditions, day2max, day2min, day2prob),
                      forecastDivider(),
                      forecastColumn(week[2],day3conditions, day3max, day3min, day3prob),
                      forecastDivider(),
                      forecastColumn(week[3],day4conditions, day4max, day4min, day4prob),
                      forecastDivider(),
                      forecastColumn(week[4],day5conditions, day5max, day5min, day5prob),
                      forecastDivider(),
                      forecastColumn(week[5],day6conditions, day6max, day6min, day6prob),
                      forecastDivider(),
                      forecastColumn(week[6],day7conditions, day7max, day7min, day7prob),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



