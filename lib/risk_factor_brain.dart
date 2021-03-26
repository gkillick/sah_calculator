import 'package:flutter/cupertino.dart';
import 'package:sah_calculator/risk_factor_toggle.dart';

import 'risk_factor.dart';

class RiskFactorBrain {
  List _historyRiskFactors = [
    RiskFactor(
        title: "Age ≥ 40",
        positiveLR: 1.73,
        negativeLR: 0.21,
        sensitivity: 0.9,
        specificity: 0.7,
        ref: 2),
    RiskFactor(
        title: "Witnessed LOC at time of headache",
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
        ref: 2),
    RiskFactor(
        title: "Objective Neck Stiffness",
        positiveLR: 6.59,
        negativeLR: 0.78,
        sensitivity: 0.29,
        specificity: 0.96,
        ref: 2),
    RiskFactor(
        title: "Subjective Neck Stiffness",
        positiveLR: 4.12,
        negativeLR: 0.73,
        sensitivity: 0.33,
        specificity: 0.95,
        ref: 2),
    RiskFactor(
        title: "Exertion at onset",
        positiveLR: 1.7,
        negativeLR: 0.88,
        sensitivity: 0.29,
        specificity: 0.87,
        ref: 2),
    RiskFactor(
        title: "Vomiting",
        positiveLR: 1.92,
        negativeLR: 0.52,
        sensitivity: 0.65,
        specificity: 0.72,
        ref: 2),
    RiskFactor(
        title: "Burst of Explode at onset (1s to peak)",
        positiveLR: 1.34,
        negativeLR: 0.74,
        sensitivity: 0.58,
        specificity: 0.5,
        ref: 2),
    RiskFactor(
        title: "Worst Headache of Life",
        positiveLR: 1.25,
        negativeLR: 0.24,
        sensitivity: 0.89,
        specificity: 0.26,
        ref: 2),
    RiskFactor(
        title: "Altered Mental Status",
        positiveLR: 2.18,
        negativeLR: 0.87,
        sensitivity: 0.25,
        specificity: 0.91,
        ref: 2),
    //add in other factors
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

  List _lpRiskFactors = [
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

  List _angioRiskFactors = [
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

  List<Widget> getCTriskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in _ctRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  List<Widget> getLPriskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in _lpRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  List<Widget> getAngioRiskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in _angioRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  RiskFactor getRiskFactor() {
    return _historyRiskFactors.first;
  }
}
