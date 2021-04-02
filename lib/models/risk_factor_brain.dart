import 'package:flutter/cupertino.dart';
import 'package:sah_calculator/widgets/risk_factor_toggle.dart';

import 'risk_factor.dart';

class RiskFactorBrain extends ChangeNotifier {
  int testsPerformed = 0;
  double probabilityOfSAH = 0.01;
  bool peakHeadache = false;

  double postHistoryProbability = 0;
  double postCTProbability = 0;
  double postLPProbability = 0;
  double postAngioProbability = 0;

  List ottowaRule = [
    RiskFactor(
        title: "Ottawa rule",
        positiveLR: 1.73,
        negativeLR: 0.21,
        sensitivity: 0.9,
        specificity: 0.7,
        ref: 2),
  ];
  List historyRiskFactors = [
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

  List ctRiskFactors = [
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
  ];

  List lpRiskFactors = [
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

  List angioRiskFactors = [
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
    for (RiskFactor riskFactor in historyRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  List<Widget> getCTriskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in ctRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  List<Widget> getLPriskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in lpRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  List<Widget> getAngioRiskFactors() {
    List<Widget> factors = [];
    for (RiskFactor riskFactor in angioRiskFactors) {
      factors.add(RiskFactorToggle(riskFactor));
    }
    return factors;
  }

  //reset selected values
  void resetSelectedRiskFactors() {
    historyRiskFactors.forEach((factor) => factor.selected = 1);
    ctRiskFactors.forEach((factor) => factor.selected = 1);
    lpRiskFactors.forEach((factor) => factor.selected = 1);
    angioRiskFactors.forEach((factor) => factor.selected = 1);
    peakHeadache = false;
    calculateTestsPerformed();
    probabilityOfSAH = 0.01;
    calculateRiskProbability();
    notifyListeners();
  }

  //update state of selected risk factor value
  void updateRiskFactor(RiskFactor factor, int selectedValue) {
    factor.selected = selectedValue;
    calculateTestsPerformed();
    calculateRiskProbability();
  }

  //calculate tests performed when test selected
  void calculateTestsPerformed() {
    int testsPerformed = 0;
    historyRiskFactors.forEach((factor) {
      if (factor.selected != 1) {
        testsPerformed++;
      }
    });
    ctRiskFactors.forEach((factor) {
      if (factor.selected != 1) {
        testsPerformed++;
      }
    });
    lpRiskFactors.forEach((factor) {
      if (factor.selected != 1) {
        testsPerformed++;
      }
    });
    angioRiskFactors.forEach((factor) {
      if (factor.selected != 1) {
        testsPerformed++;
      }
    });

    this.testsPerformed = testsPerformed;
  }

  void calculateRiskProbability() {
    if (peakHeadache) {
      probabilityOfSAH = 0.075;
    } else {
      probabilityOfSAH = 0.01;
    }
    calculateRiskForCatagory(historyRiskFactors);
    postHistoryProbability = probabilityOfSAH;
    calculateRiskForCatagory(ctRiskFactors);
    postCTProbability = probabilityOfSAH;
    calculateRiskForCatagory(lpRiskFactors);
    postLPProbability = probabilityOfSAH;
    calculateRiskForCatagory(angioRiskFactors);
    postAngioProbability = probabilityOfSAH;
    notifyListeners();
  }

  void calculateRiskForCatagory(List factors) {
    factors.forEach((factor) {
      if (factor.selected != 1) {
        probabilityOfSAH = getNewProbability(probabilityOfSAH,
            factor.sensitivity, factor.specificity, factor.selected);
      }
    });
  }

  //Calculate a post-test probability from pretest, sens, spec, and mode
// where mode==1 is "+" test result, mode==-1 is "-" test result
  double getNewProbability(pre, sens, spec, selected) {
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

  //toggle peak headache within 1 hr to set the SAH probability starting point
  bool setHeadache() {
    peakHeadache = !peakHeadache;
    calculateRiskProbability();
    return peakHeadache;
  }
}
