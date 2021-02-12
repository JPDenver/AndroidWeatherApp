import 'package:WeatherApp/Locations/denverforecastpage.dart';
import 'package:WeatherApp/Locations/peoria.dart';
import 'package:WeatherApp/Locations/peoriaforecast.dart';
import 'package:WeatherApp/Locations/peoriaforecastpage.dart';
import 'package:WeatherApp/Widgets/weekday.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:WeatherApp/home_page.dart';

import 'Locations/denver.dart';

void main() => runApp(MaterialApp(
      title: "Weather App",
      home: Home(),
    ));

