import 'package:flutter/cupertino.dart';
import 'package:sah_calculator/risk_factor_toggle.dart';

import 'risk_factor.dart';

class RiskFactorBrain {
  List _historyRiskFactors = [
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

  List _ctRiskFactors = [
    RiskFactor(
        title: "< 6hours: Non contrast head CT",
        positiveLR: 234.55,
        negativeLR: 0.01,
        sensitivity: 1.0,
        specificity: 1.0,
        ref: 2),
    RiskFactor(
        title: "> 6 hours: Non contrast CT head",
        positiveLR: 223.37,
        negativeLR: 0.07,
        sensitivity: 0.89,
        specificity: 1.0,
        ref: 2),
    RiskFactor(
        title: "Focal Neuro Deficit",
        positiveLR: 3.26,
        negativeLR: 0.81,
        sensitivity: 0.31,
        specificity: 0.93,
        ref: 2)
  ];

  List _lpFactors = [
    RiskFactor(
        title: "Xanthochromia on visual inspection",
        positiveLR: 12.56,
        negativeLR: 0.3,
        sensitivity: 0.71,
        specificity: 0.93,
        ref: 2),
    RiskFactor(
        title: "RBC in tube 4 > 1000",
        positiveLR: 5.66,
        negativeLR: 0.21,
        sensitivity: 0.76,
        specificity: 0.88,
        ref: 2),
  ];

  List _angioFactors = [
    RiskFactor(
        title: "Negative CT Angiogram",
        positiveLR: 1.0 / 0.0,
        negativeLR: 0.02,
        sensitivity: 0.98,
        specificity: 1.0,
        ref: 3),
  ];

  List<Widget> getHistoryRiskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in _historyRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }
}
