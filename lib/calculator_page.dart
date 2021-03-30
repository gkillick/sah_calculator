import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sah_calculator/models/risk_factor_brain.dart';
import 'package:sah_calculator/widgets/risk_factor_toggle.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';
import 'package:sah_calculator/widgets/factor_list.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          FactorsList(),
          Container(
            padding: EdgeInsets.all(20),
            width: 1 / 0,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Probability for ${Provider.of<RiskFactorBrain>(context).testsPerformed} tests',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '${Provider.of<RiskFactorBrain>(context).probabilityOfSAH.toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0), topLeft: Radius.circular(0)),
            ),
          ),
        ],
      ),
    );
  }
}

PanelController _pc = new PanelController();
