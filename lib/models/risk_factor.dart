import 'package:csv/csv.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:sah_calculator/widgets/risk_factor_toggle.dart';

class RiskFactor {
  String title;
  String tooltip;
  double positiveLR;
  double negativeLR;
  double sensitivity;
  double specificity;
  int ref;
  int selected = 1; //0 1 or 2
  int mutuallyExclusive = 0;

  RiskFactor(
      {this.title,
      this.positiveLR,
      this.negativeLR,
      this.sensitivity,
      this.specificity,
      this.ref,
      this.tooltip,
      this.mutuallyExclusive});
}

class SetOfTests {
  String name;
  int testsPerformed = 0;
  double postTestProbability = 0;
  List<RiskFactor> riskFactors;

  SetOfTests(
      String name, List<RiskFactor> riskFactors, double preTestProbability) {
    this.name = name;
    this.riskFactors = riskFactors;
    this.calculate(preTestProbability);
  }

  List<Widget> getFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in riskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  void resetFactors() {
    this.riskFactors.forEach((factor) {
      factor.selected = 1;
    });
  }

  double calculate(double preTestProbability) {
    this.postTestProbability = preTestProbability;
    this.riskFactors.forEach((factor) {
      this.postTestProbability = updateProbability(this.postTestProbability,
          factor.sensitivity, factor.specificity, factor.selected);
      if (factor.selected != 1) {
        this.testsPerformed++;
      }
    });
    return this.postTestProbability;
  }
}

double updateProbability(pre, sens, spec, selected) {
  double mode;
  if (selected == 0) {
    mode = 1.0;
  } else {
    mode = -1.0;
  }
  double a = sens * pre;
  double c = (1 - sens) * pre;
  double d = spec * (1 - pre);
  double b = (1 - spec) * (1 - pre);

  if (mode == 1) {
    return a / (a + b);
  } else {
    return c / (c + d);
  }
}

Future<SetOfTests> getFactorList(String path) async {
  final input = new File(path).openRead();
  //problem is between here?
  final fields = await input
      .transform(utf8.decoder)
      .transform(new CsvToListConverter(eol: "\n"))
      .toList();
  //and here
  final name = fields[0][0];
  List<RiskFactor> riskFactors = [];
  for (var i = 1; i < fields.length; i++) {
    riskFactors.add(new RiskFactor(
      title: fields[i][0],
      positiveLR: fields[i][1],
      negativeLR: fields[i][2],
      sensitivity: fields[i][3],
      specificity: fields[i][4],
      ref: fields[i][5],
      tooltip: fields[i][6],
      mutuallyExclusive: fields[i][7],
    ));
  }
  return SetOfTests(name, riskFactors, 0.0);
}
