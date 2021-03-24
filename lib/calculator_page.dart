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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
        body: Center(
            child: Column(
          children: riskFactorBrain.getRiskFactors(),
        )),
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
