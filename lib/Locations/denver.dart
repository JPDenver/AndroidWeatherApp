import 'package:WeatherApp/Locations/denverforecastpage.dart';
import 'package:WeatherApp/Widgets/weatherdrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


GetDay() {
  var date = DateTime.now();
  var time = DateFormat('kk:mm').format(date);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var feelsLike;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  //This Should Be everything to change for a a new page
  String forecastRoute = "Denver";
  String imagePath = 'assets/denver-skyline.png';
  Function goToForecast = () => DenverForecastPage();


  String columnItemColor = 'white';


  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=$forecastRoute&units=imperial&appid=cede032f308595f7c8c256d0de8e31a6");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.feelsLike = results['main']['feels_like'];
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
    var date = DateTime.now();
    var time = DateFormat('kk:mm').format(date);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: WeatherDrawer(),
        backgroundColor: Colors.blueGrey[800],
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Denver, Colorado",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      temp != null ? temp.toStringAsFixed(0) + "\u00B0" : "Loading",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.blue[600],
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
                        feelsLike != null ? feelsLike.toString() + "\u00B0" : "Loading",
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
                        humidity != null ? humidity.toString() + '%' : "Loading",
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
                        windSpeed != null ? windSpeed.toString() + ' mph' : "Loading",
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
                      icon: Icon(Icons.cloud,
                        color: Colors.white,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => goToForecast()),
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