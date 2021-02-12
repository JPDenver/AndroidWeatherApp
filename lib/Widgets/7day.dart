
import 'package:WeatherApp/Widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'Daily Forecast.dart';

Function goToDailyForecast = () => DailyForecastPage();





forecastColumn(day, conditions, max, min, prob) {

  return Column(
    children: <Widget>[
      SizedBox(height: 10,),
      Container(
        child: Text(day,
          style: simpleTextStyle(),
        ),
      ),
      SizedBox(height: 20,),
      Container(
        child: Text(
          conditions.toString(),style: simpleTextStyle(),
        ),
      ),
      horizontalSpace(),
      Container(
        child: Text(
          max != null ? max.toStringAsFixed(0) + "\u00B0": "Loading",
          style: simpleTextStyle(),
        ),
      ),
      SizedBox(height: 20,),
      Container(
        child: Text(
          min!=null ? min.toStringAsFixed(0)+ "\u00B0": "Loading",
          style: simpleTextStyle(),
        ),
      ),

      horizontalSpace(),
      Container(
        child: Text(
          prob!=null ? prob.toStringAsFixed(0) + "%" : "Loading",
          style: simpleTextStyle(),
        ),
      ),
      horizontalSpace(),
      FlatButton(
          minWidth: 10,
          child: Text("More...",
          style: simpleTextStyle(),
          ))



    ],
  );
}

sevenDayLabels(){
  return Column(
    children: [
      SizedBox(height: 10,),
      Container(
        child: Text("DAY",
          style: simpleTextStyle(),
        ),
      ),
      SizedBox(height: 20,),
      Container(
        child: Text('COND.',style: simpleTextStyle(),),
      ),
      SizedBox(height: 20,),
      Container(
        child: Text('HIGH',
          style: simpleTextStyle(),
        ),
      ),
      SizedBox(height: 20,),
      Container(
        child: Text('LOW',style: simpleTextStyle(),),
      ),

      horizontalSpace(),
      Container(
          child: Text('PROB.',style: simpleTextStyle(),)
      )

    ],
  );
}

sevenDayTitle(){
  return Container(
    height:70,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "7-Day Forecast",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,

        ),

      ),
    ),

  );
}