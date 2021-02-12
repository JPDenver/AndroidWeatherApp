import 'package:WeatherApp/Widgets/weatherdrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../home_page.dart';
import 'littletonforecastpage.dart';


class Littleton extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Littleton> {
  var temp;
  var feels_like;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  String columnItemColor = 'white';

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Littleton&units=imperial&appid=cede032f308595f7c8c256d0de8e31a6");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.feels_like = results['main']['feels_like'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: WeatherDrawer(),
        backgroundColor: Colors.blueGrey[800],
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Littleton.jpg'),
                    fit: BoxFit.cover,
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),

                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          'Littleton, CO',
                          style: TextStyle(
                            fontSize: 55,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.black,
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          'Littleton, CO',
                          style: TextStyle(
                            fontSize: 55,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        temp != null ? temp.toString() + "\u00B0" : "Loading",
                        style: TextStyle(
                          fontSize: 50,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.black,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        temp != null ? temp.toString() + "\u00B0" : "Loading",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey[600],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(

                  children: <Widget>[
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf,
                        color: Colors.white,
                      ),
                      title: Text("Feels Like",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        feels_like != null ? feels_like.toString() + "\u00B0" : "Loading",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(height: 20,
                      color: Colors.indigo,
                    ),

                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud,
                        color: Colors.white,
                      ),
                      title: Text("Conditions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),),
                      trailing: Text(description != null
                          ? description.toString()
                          : "Loading",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(height: 20,
                      color: Colors.indigo,
                    ),


                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun,
                        color: Colors.white,
                      ),
                      title: Text("Humidity",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        humidity != null ? humidity.toString() + "%" : "Loading",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(height: 20,
                      color: Colors.indigo,
                    ),


                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind,
                        color: Colors.white,
                      ),
                      title: Text("Wind",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        windSpeed != null ? windSpeed.toString() + " mph" : "Loading",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Divider(height: 20,
                      color: Colors.indigo,
                    ),
                    FlatButton.icon(

                      label: Text(
                        "Forecast",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(Icons.location_on_outlined,
                        color: Colors.white,),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LittletonForecastPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}