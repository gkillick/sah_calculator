import 'package:flutter/cupertino.dart';
import 'package:sah_calculator/risk_factor_toggle.dart';

import 'risk_factor.dart';

class RiskFactorBrain {
  List _riskFactors = [
    RiskFactor(
        title: "Ambulance Arrival",
        positiveLR: 2.95,
        negativeLR: 0.51,
        sensitivity: 0.59,
        specificity: 0.8,
        ref: 2),
    RiskFactor(
        title: "Whitnessed LOC",
        positiveLR: 1.87,
        negativeLR: 0.91,
        sensitivity: 0.16,
        specificity: 0.95,
        ref: 2),
    RiskFactor(
        title: "Focal Neuro Deficit",
        positiveLR: 3.26,
        negativeLR: 0.81,
        sensitivity: 0.31,
        specificity: 0.93,
        ref: 2)
  ];

  List<Widget> getRiskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in _riskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }
}
