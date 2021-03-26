import 'package:flutter/material.dart';
import 'package:sah_calculator/calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF6F45CB),
          scaffoldBackgroundColor: Color(0xFF6F45CB),
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
          )),
      home: CalculatorPage(title: 'SAH Calculator'),
    );
  }
}
