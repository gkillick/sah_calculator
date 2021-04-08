import 'package:flutter/material.dart';
import 'package:sah_calculator/calculator_page.dart';
import 'package:provider/provider.dart';
import 'package:sah_calculator/models/risk_factor_brain.dart';
import 'package:sah_calculator/models/risk_factor.dart';

void main() async {
  List<SetOfRiskFactors> testSets = [];
  var brain = RiskFactorBrain(testSets);
  runApp(MyApp(brain));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  RiskFactorBrain riskFactorBrain;
  MyApp(brain) {
    this.riskFactorBrain = brain;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RiskFactorBrain>(
      create: (context) => this.riskFactorBrain,
      child: MaterialApp(
        title: 'SAH Calculator',
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
