import 'package:flutter/material.dart';
import 'package:sah_calculator/calculator_page.dart';
import 'package:provider/provider.dart';
import 'package:sah_calculator/models/risk_factor_brain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RiskFactorBrain>(
      create: (context) => RiskFactorBrain(),
      child: MaterialApp(
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
      ),
    );
  }
}
