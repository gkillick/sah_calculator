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

    List<Widget> pretest = [
      SizedBox(
        height: 30,
      ),
      Text(
        'Pretest Probability',
        style: Theme
            .of(context)
            .textTheme
            .headline3,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('> 1 hour to peak headache: 1%'),
            ),
            HeadacheToggle(toggleTrue: false),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('< 1 hour to peak severe headache: 7.5%'),
            ),
            HeadacheToggle(toggleTrue: true),
          ],
        ),
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
    ];

    List<Widget> factorLists = [];

    Provider
      .of<RiskFactorBrain>(context)
      .testSets
      .forEach(
          (testSet) {
        factorLists.add(Text(
          testSet.name,
          style: Theme
              .of(context)
              .textTheme
              .headline3,
          )
        );
        factorLists.add(Column(
            children: testSet.getFactors(),
          )
        );
        factorLists.add(ProbabilityRecommendation(
            title: testSet.name,
            threshold: 2,
            probability: testSet.postTestProbability,
            recommendation: "Not Implemented",
            )
        );
          factorLists.add(
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
                ),
              ),
              );
          }
      );

    List<Widget> bottomOfApp = [
      SizedBox(
        width: 275,
        child: TextButton(
          onPressed: () =>
              Provider.of<RiskFactorBrain>(context, listen: false)
                  .reset(),
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
    ];


    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: pretest + factorLists + bottomOfApp
          ),
        ),
      ),
    );
  }
}

class HeadacheToggle extends StatefulWidget {
  HeadacheToggle({this.toggleTrue});

  bool toggleTrue;

  @override
  _HeadacheToggleState createState() => _HeadacheToggleState();
}

class _HeadacheToggleState extends State<HeadacheToggle> {
  @override
  Widget build(BuildContext context) {
    //conditionally set the toggle so they are mutually exclusive
    bool toggleValue = Provider
        .of<RiskFactorBrain>(context)
        .peakHeadache;
    if (!widget.toggleTrue) {
      toggleValue = !toggleValue;
    }
    return Switch(
      value: toggleValue,
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
