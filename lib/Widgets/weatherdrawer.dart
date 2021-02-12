import 'package:WeatherApp/Locations/litttleton.dart';
import 'package:WeatherApp/Locations/peoria.dart';
import 'package:WeatherApp/Search/searchpage.dart';
import 'package:WeatherApp/Locations/denver.dart';
import 'package:flutter/material.dart';


class SearchCity{
  String searchCityName;
  SearchCity({this.searchCityName});
}


class WeatherDrawer extends StatefulWidget {
  @override
  _WeatherDrawerState createState() => _WeatherDrawerState();
}

class _WeatherDrawerState extends State<WeatherDrawer> {


  TextEditingController searchTextEditingController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 80,
            child: DrawerHeader(
              child: Text(
                'Menu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              children: [Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchTextEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search by City,State...",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 18
                      ),
                      border: InputBorder.none,
                  ),
                ),
                    )),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage(searchCity: searchTextEditingController.text)),
                    );
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0x36FFFFFF),
                                const Color(0x0FFFFFF),
                              ]
                          ),
                          borderRadius: BorderRadius.circular(40)

                      ),
                      padding: EdgeInsets.all(12),
                      child: Image.asset('assets/search_white.png'),
                ),
                )],
            ),
          ),
          ListTile(
            tileColor: Colors.blueGrey[50],
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            title: Text(
              'Denver, Colorado',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.blueGrey[50],
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Peoria()),
              );
            },
            title: Text(
              'Peoria, Illinois',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.blueGrey[50],
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Littleton()),
              );
            },
            title: Text(
              'Littleton, Colorado',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

