
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
}

Container forecastDivider(){
  return Container(
    child: VerticalDivider(
      color: Colors.white,
    ),
  );
}

SizedBox horizontalSpace(){
  return SizedBox(height: 20,);
}


CityName(String city){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              city,
              style: TextStyle(
                fontSize: 45,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.black,
              ),
            ),
            // Solid text as fill.
            Text(
              city,
              style: TextStyle(
                fontSize: 45,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}