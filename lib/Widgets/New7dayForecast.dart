import 'package:WeatherApp/Widgets/7day.dart';
import 'package:WeatherApp/Widgets/Daily%20Forecast.dart';
import 'package:WeatherApp/Widgets/widgets.dart';
import 'package:flutter/material.dart';


class ForecastColumn2 extends StatefulWidget {
  final String forecastday;
  final String day;
  final String conditions;
  final double max;
  final double min;
  final double prob;
  ForecastColumn2({Key key,this.forecastday, this.day,this.conditions, this.max, this.min, this.prob}): super (key:key);
  @override
  _ForecastColumn2State createState() => _ForecastColumn2State();
}

class _ForecastColumn2State extends State<ForecastColumn2> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
        SizedBox(height: 10,),
        Container(
          child: Text(widget.day,
            style: simpleTextStyle(),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          child: Text(
            widget.conditions.toString(),style: simpleTextStyle(),
          ),
        ),
        horizontalSpace(),
        Container(
          child: Text(
            widget.max != null ? widget.max.toStringAsFixed(0) + "\u00B0": "Loading",
            style: simpleTextStyle(),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          child: Text(
            widget.min!=null ? widget.min.toStringAsFixed(0)+ "\u00B0": "Loading",
            style: simpleTextStyle(),
          ),
        ),

        horizontalSpace(),
        Container(
          child: Text(
            widget.prob!=null ? widget.prob.toStringAsFixed(0) + "%" : "Loading",
            style: simpleTextStyle(),
          ),
        ),
        horizontalSpace(),
        FlatButton(
          minWidth: 10,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DailyForecastPage(searchCity: "Denver", forecastday: widget.forecastday,
                  day: widget.day, conditions: widget.conditions, max: widget.max, min: widget.min, prob: widget.prob,
                )),
              );
            },
          child: Text("More...",
          style: simpleTextStyle(),
        ))



    ],
    );
  }
}
