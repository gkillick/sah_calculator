import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sah_calculator/calculator_page.dart';
import 'package:sah_calculator/models/risk_factor.dart';
import 'package:sah_calculator/models/risk_factor_brain.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:provider/provider.dart';

class RiskFactorToggle extends StatelessWidget {
  RiskFactorToggle(this.riskFactor);
  final RiskFactor riskFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    riskFactor.title,
                    style: TextStyle(),
                  ),
                  ConditionalToolTip(
                    tooltipText: riskFactor.tooltip,
                  ),
                ],
              ),
            ),
          ),
          ToggleSwitch(
            minWidth: 90.0,
            minHeight: 70.0,
            initialLabelIndex: riskFactor.selected,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Color(0xFF916AFF),
            inactiveFgColor: Colors.white,
            labels: ['', '', ''],
            icons: [
              Icons.add,
              Icons.not_interested,
              Icons.remove,
            ],
            iconSize: 30.0,
            activeBgColors: [
              Color(0xFFFB3469),
              Color(0xFF161A51),
              Color(0xFF73C9E2),
            ],
            onToggle: (index) {
              //update selected risk factor
              Provider.of<RiskFactorBrain>(context, listen: false)
                  .updateRiskFactor(riskFactor, index);
            },
          ),
        ],
      ),
    );
  }
}

class ConditionalToolTip extends StatelessWidget {
  ConditionalToolTip({this.tooltipText});

  String tooltipText;
  @override
  Widget build(BuildContext context) {
    return (tooltipText != null)
        ? Tooltip(
            message: tooltipText,
            decoration: BoxDecoration(
              color: Color(0xff2b2b2b),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            textStyle: TextStyle(fontSize: 12, color: Colors.white),
            child: IconButton(
              icon: Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
              onPressed: () {
                /* your code */
              },
            ),
          )
        : SizedBox(
            height: 0,
          );
  }
}
