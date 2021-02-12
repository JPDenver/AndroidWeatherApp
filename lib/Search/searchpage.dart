import 'package:WeatherApp/Locations/denverforecastpage.dart';
import 'package:WeatherApp/Search/searchforecastpage.dart';
import 'package:WeatherApp/Widgets/7day.dart';
import 'package:WeatherApp/Widgets/weatherdrawer.dart';
import 'package:WeatherApp/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


GetDay() {
  var date = DateTime.now();
  var time = DateFormat('kk:mm').format(date);
  var today = DateFormat('EEEE').format(date);
}

class SearchPage extends StatefulWidget {
  final String searchCity;
  SearchPage({Key key, this.searchCity}): super (key:key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  var lat;
  var long;
  var temp;
  var feelsLike;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  //This Should Be everything to change for a a new page
  String forecastRoute;
  String imagePath = 'assets/Sun.png';
  // Function goToForecast = () => SearchForecastPage();


  String columnItemColor = 'white';
  @override
  void initState() {

    super.initState();
    this.getWeather();
  }


  Future getWeather() async {
    String forecastRoute = widget.searchCity;
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
      this.lat = results['coord']['lat'].toString();
      this.long = results['coord']['lon'].toString();
    });
  }




  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var time = DateFormat('kk:mm').format(date);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.searchCity.toUpperCase(),
          style: TextStyle(
            fontSize: 28
          ),
          ),
        ),
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
                    fit: BoxFit.contain,
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        temp != null ? temp.toStringAsFixed(0) + "\u00B0" : "Loading",
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
                        temp != null ? temp.toStringAsFixed(0) + "\u00B0" : "Loading",
                        style: TextStyle(
                          fontSize: 55,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        time,
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
                        time,
                        style: TextStyle(
                          fontSize: 55,
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
                        lat != null ? lat.toString() + ' mph' : "Loading",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
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
                          MaterialPageRoute(builder: (context) => SearchForecastPage(lat: lat,long: long,searchCity: widget.searchCity,)),
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




// class SearchForecastPage extends StatefulWidget {
//   final String lat;
//   final String long;
//   SearchForecastPage({Key key, this.lat,this.long}): super (key:key);
//
//   @override
//   _SearchForecastPageState createState() => _SearchForecastPageState();
// }
//
// class _SearchForecastPageState extends State<SearchForecastPage> {
//
//   var day1min; var day1max; var day1conditions; var day1prob;
//
//   var day2min;var day2max;var day2conditions;var day2prob;
//
//   var day3min;var day3max;var day3conditions;var day3prob;
//
//   var day4min;var day4max;var day4conditions;var day4prob;
//
//   var day5min;var day5max;var day5conditions;var day5prob;
//
//   var day6min;var day6max;var day6conditions;var day6prob;
//
//   var day7min;var day7max;var day7conditions;var day7prob;
//
//
//   Future getForecast() async {
//     final String long = widget.long;
//     final String lat = widget.lat;
//     http.Response response = await http.get(
//         "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=imperial&appid=cede032f308595f7c8c256d0de8e31a6");
//     var results = jsonDecode(response.body);
//     setState(() {
//       this.day1min = results['daily'][0]['temp']['min'];
//       this.day1max = results['daily'][0]['temp']['max'];
//       this.day1conditions = results['daily'][0]['weather'][0]['description'];
//       this.day1prob = results['daily'][0]['pop']*100;
//
//       this.day2min = results['daily'][1]['temp']['min'];
//       this.day2max = results['daily'][1]['temp']['max'];
//       this.day2conditions = results['daily'][1]['weather'][0]['description'];
//       this.day2prob = results['daily'][1]['pop']*100;
//
//       this.day3min = results['daily'][2]['temp']['min'];
//       this.day3max = results['daily'][2]['temp']['max'];
//       this.day3conditions = results['daily'][2]['weather'][0]['description'];
//       this.day3prob = results['daily'][2]['pop']*100;
//
//       this.day4min = results['daily'][3]['temp']['min'];
//       this.day4max = results['daily'][3]['temp']['max'];
//       this.day4conditions = results['daily'][3]['weather'][0]['description'];
//       this.day4prob = results['daily'][3]['pop']*100;
//
//       this.day5min = results['daily'][4]['temp']['min'];
//       this.day5max = results['daily'][4]['temp']['max'];
//       this.day5conditions = results['daily'][0]['weather'][0]['description'];
//       this.day5prob = results['daily'][0]['pop']*100;
//
//       this.day6min = results['daily'][5]['temp']['min'];
//       this.day6max = results['daily'][5]['temp']['max'];
//       this.day6conditions = results['daily'][5]['weather'][0]['description'];
//       this.day6prob = results['daily'][5]['pop']*100;
//
//       this.day7min = results['daily'][6]['temp']['min'];
//       this.day7max = results['daily'][6]['temp']['max'];
//       this.day7conditions = results['daily'][6]['weather'][0]['description'];
//       this.day7prob = results['daily'][6]['pop']*100;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     this.getForecast();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var date = DateTime.now();
//     var today = DateFormat('EEEE').format(date);
//     dynamic week = [];
//     if(today == 'Monday'){
//       print('yes');
//       week = ["Tue","Wed","Thu","Fri","Sat","Sun","Mon"];
//       print(week);
//     } else if(today == 'Tuesday'){
//       week = ["Wed","Thu","Fri","Sat","Sun","Mon","Tue",];
//     } else if(today == 'Wednesday'){
//       week = ["Thu","Fri","Sat","Sun","Mon","Tue","Wed",];
//     } else if(today == 'Thursday'){
//       week = ["Fri","Sat","Sun","Mon","Tue","Wed","Thu",];
//     } else if(today == 'Friday'){
//       week = ["Sat","Sun","Mon","Tue","Wed","Thu","Fri",];
//     } else if(today == 'Saturday'){
//       week = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat",];
//     } else if(today == 'Sunday'){
//       week = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun",];
//     }
//
//
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.blueGrey[800],
//         appBar: AppBar(),
//         body: Column(
//           children: <Widget>[
//             Container(
//                 height: MediaQuery.of(context).size.height / 4.5,
//                 width: MediaQuery.of(context).size.width,
//                 // color: Colors.red,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/denver-skyline.png'),
//                       fit: BoxFit.cover,
//                     )
//                 ),
//                 child: CityName("FIX THIS")
//             ),
//             Container(
//               height: 10,
//               color: Colors.blue[600],
//             ),
//             sevenDayTitle(),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(30,0,30,30),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: <Widget>[
//                       sevenDayLabels(),
//                       forecastDivider(),
//                       forecastColumn(week[0],day1conditions, day1max, day1min, day1prob),
//                       forecastDivider(),
//                       forecastColumn(week[1],day2conditions, day2max, day2min, day2prob),
//                       forecastDivider(),
//                       forecastColumn(week[2],day3conditions, day3max, day3min, day3prob),
//                       forecastDivider(),
//                       forecastColumn(week[3],day4conditions, day4max, day4min, day4prob),
//                       forecastDivider(),
//                       forecastColumn(week[4],day5conditions, day5max, day5min, day5prob),
//                       forecastDivider(),
//                       forecastColumn(week[5],day6conditions, day6max, day6min, day6prob),
//                       forecastDivider(),
//                       forecastColumn(week[6],day7conditions, day7max, day7min, day7prob),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
