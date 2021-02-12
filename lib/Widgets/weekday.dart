import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// print(DateFormat('EEEE, d MMM, yyyy').format(date)); // prints Tuesday, 10 Dec, 2019
// print(DateFormat('h:mm a').format(date)); // prints 10:02 AM


GetDay() {
  var date = DateTime.now();
  print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
  var today = DateFormat('EEEE').format(date);
  print(today);// prints Tuesday
}





