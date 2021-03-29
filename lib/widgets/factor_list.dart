import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sah_calculator/models/risk_factor_brain.dart';

class FactorsList extends StatelessWidget {
  const FactorsList({
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
            Text(
              'History Factors',
              style: Theme.of(context).textTheme.headline3,
            ),
            Column(
              children:
                  Provider.of<RiskFactorBrain>(context).getHistoryRiskFactors(),
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
            Text(
              'CT Factors',
              style: Theme.of(context).textTheme.headline3,
            ),
            Column(
              children:
                  Provider.of<RiskFactorBrain>(context).getCTriskFactors(),
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
            Text(
              'LP Factors',
              style: Theme.of(context).textTheme.headline3,
            ),
            Column(
              children:
                  Provider.of<RiskFactorBrain>(context).getLPriskFactors(),
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
            Text(
              'Angio Factors',
              style: Theme.of(context).textTheme.headline3,
            ),
            Column(
              children:
                  Provider.of<RiskFactorBrain>(context).getAngioRiskFactors(),
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
        )),
      ),
    );
  }
}
