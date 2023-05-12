import 'package:flutter/material.dart';
import 'package:my_app/pages/phone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/verify.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,

    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify()
    },
  ));
}