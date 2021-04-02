import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sah_calculator/models/risk_factor_brain.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FactorList extends StatelessWidget {
  const FactorList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Peak headache within 1 hr'),
                    ),
                    HeadacheToggle(),
                  ],
                ),
              ),
              Text(
                'History Factors',
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children: Provider.of<RiskFactorBrain>(context)
                    .getHistoryRiskFactors(),
              ),
              ProbabilityRecommendation(
                  title: 'Post History Probability',
                  threshold: .02,
                  probability: Provider.of<RiskFactorBrain>(context)
                      .postHistoryProbability,
                  recommendation: 'Proceed to CT Test'),
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
                children:
                    Provider.of<RiskFactorBrain>(context).getCTriskFactors(),
              ),
              ProbabilityRecommendation(
                  title: 'Post History Probability',
                  threshold: .5,
                  probability:
                      Provider.of<RiskFactorBrain>(context).postCTProbability,
                  recommendation:
                      'SAH ruled in, positive- CT-A, consult neurosurgeon'),
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
                'LP Factors',
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children:
                    Provider.of<RiskFactorBrain>(context).getLPriskFactors(),
              ),
              ProbabilityRecommendation(
                  title: 'Post CT Probability',
                  threshold: .16,
                  probability:
                      Provider.of<RiskFactorBrain>(context).postLPProbability,
                  recommendation:
                      'SAH ruled in, positive- CT-A, consult neurosurgeon'),
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
                'Angio Factors',
                style: Theme.of(context).textTheme.headline3,
              ),
              Column(
                children:
                    Provider.of<RiskFactorBrain>(context).getAngioRiskFactors(),
              ),
              ProbabilityRecommendation(
                  title: 'Post Angio Probability',
                  threshold: .86,
                  probability: Provider.of<RiskFactorBrain>(context)
                      .postAngioProbability,
                  recommendation: 'SAH likely, consult neurosurgery, LP'),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              SizedBox(
                width: 275,
                child: TextButton(
                  onPressed: () =>
                      Provider.of<RiskFactorBrain>(context, listen: false)
                          .resetSelectedRiskFactors(),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      backgroundColor: Colors.blueAccent),
                  child: Text(
                    'Reset Tests',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HeadacheToggle extends StatefulWidget {
  @override
  _HeadacheToggleState createState() => _HeadacheToggleState();
}

class _HeadacheToggleState extends State<HeadacheToggle> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<RiskFactorBrain>(context).peakHeadache,
      onChanged: (value) {
        setState(() {
          value = Provider.of<RiskFactorBrain>(context, listen: false)
              .setHeadache();
        });
      },
      activeTrackColor: Colors.red,
      activeColor: Colors.white,
    );
  }
}

class ProbabilityRecommendation extends StatelessWidget {
  ProbabilityRecommendation(
      {this.title, this.threshold, this.probability, this.recommendation});
  String title;
  double threshold;
  double probability;
  String recommendation;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      // any logic needed...
      final condition = probability > threshold;

      return condition
          ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(title),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${(probability * 100).toStringAsFixed(1)} %',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF916AFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              'Recommendation',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              recommendation,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(title),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${(probability * 100).toStringAsFixed(1)} %',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
