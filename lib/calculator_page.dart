import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sah_calculator/risk_factor_brain.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

RiskFactorBrain riskFactorBrain = RiskFactorBrain();

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SlidingUpPanel(
        controller: _pc,
        maxHeight: 700,
        borderRadius: BorderRadius.circular(25),
        panel: Column(
          children: [
            TextButton(
              onPressed: () => {
                if (_pc.isPanelOpen) {_pc.close()} else {_pc.open()}
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 500,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F3FC),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 4,
                        width: 35,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Predictive Values",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    PredictiveValue("Pre-CT Probability", 2.6),
                    PredictiveValue("Pre-Lumbar Puncture", 4.0),
                    PredictiveValue("Pre-Angiogram Probability", 55),
                    PredictiveValue("Post-Angiogram Probability", 53),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'History Factors',
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children: riskFactorBrain.getHistoryRiskFactors(),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              Text(
                'CT Factors',
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children: riskFactorBrain.getHistoryRiskFactors(),
              ),
              Column(
                children: riskFactorBrain.getHistoryRiskFactors(),
              ),
              SizedBox(
                height: 210,
              )
            ],
          )),
        ),
      ),
    );
  }
}

class PredictiveValue extends StatelessWidget {
  final String predictiveTitle;
  final double predictiveValue;
  PredictiveValue(this.predictiveTitle, this.predictiveValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF6F3FC),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                predictiveTitle,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                "$predictiveValue%",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PanelController _pc = new PanelController();
