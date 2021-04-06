import 'package:flutter/cupertino.dart';
import 'risk_factor.dart';

class RiskFactorBrain extends ChangeNotifier {
  int testsPerformed = 0;
  double probabilityOfSAH = 0.01;
  bool peakHeadache = false;
  List<SetOfTests> testSets = [];
  List<RiskFactor> allFactors = [];

  RiskFactorBrain(List<SetOfTests> testSets) {
    this.testSets = testSets;
    this.testSets.forEach((testSet) {
      testSet.riskFactors.forEach((factor) {
        this.allFactors.add(factor);
      });
    });
  }

  //reset selected values
  void reset() {
    this.testSets.forEach((element) {
      element.resetFactors();
    });
    this.calculate();
    this.notifyListeners();
  }

  //update state of selected risk factor value
  void updateRiskFactor(RiskFactor inFactor, int selectedValue) {
    //special case for CT mutually exclusive
    if (inFactor.mutuallyExclusive > 0) {
      this
          .allFactors
          .where((factor) =>
              inFactor.mutuallyExclusive == factor.mutuallyExclusive)
          .forEach((factor) {
        factor.selected = 1;
      });
    }
    inFactor.selected = selectedValue;
    this.calculate();
  }

  void calculate() {
    if (peakHeadache) {
      probabilityOfSAH = 0.075;
    } else {
      probabilityOfSAH = 0.01;
    }
    this.testSets.forEach((testSet) {
      probabilityOfSAH = testSet.calculate(probabilityOfSAH);
    });
    notifyListeners();
  }

  //toggle peak headache within 1 hr to set the SAH probability starting point
  bool setHeadache() {
    peakHeadache = !peakHeadache;
    calculate();
    return peakHeadache;
  }

  void buildRiskFactorTests() {
    final dataDir = "data/";
    final files = ['1.csv', '2.csv', '3.csv', '4.csv'];
    files.forEach((fileName) async {
      testSets.add(await getFactorList(dataDir + fileName));
    });
  }
}
