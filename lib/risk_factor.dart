import 'package:flutter/foundation.dart';

class RiskFactor {
  String title;
  double positiveLR;
  double negativeLR;
  double sensitivity;
  double specificity;
  int ref;
  int selected = 1; //0 1 or 2

  RiskFactor(
      {this.title,
      this.positiveLR,
      this.negativeLR,
      this.sensitivity,
      this.specificity,
      this.ref});
}
