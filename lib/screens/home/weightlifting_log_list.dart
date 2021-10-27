import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary/models/weightliftingLog.dart';

class WeightliftingLogList extends StatefulWidget {
  const WeightliftingLogList({Key? key}) : super(key: key);

  @override
  _WeightliftingLogListState createState() => _WeightliftingLogListState();
}

class _WeightliftingLogListState extends State<WeightliftingLogList> {
  @override
  Widget build(BuildContext context) {

    final logs = Provider.of<List<WeightliftingLogs?>>(context);
    logs.forEach((weightliftinglog){
      print(weightliftinglog!.date);
      print(weightliftinglog.sport);
      print(weightliftinglog.deadLiftWeight);
      print(weightliftinglog.deadLiftReps);
      print(weightliftinglog.backSquatWeight);
      print(weightliftinglog.backSquatReps);
      print(weightliftinglog.hipThrustWeight);
      print(weightliftinglog.hipThrustReps);
      print(weightliftinglog.legPressWeight);
      print(weightliftinglog.legPressReps);
      print(weightliftinglog.benchPressWeight);
      print(weightliftinglog.benchPressReps);
      print(weightliftinglog.lateralPulldownWeight);
      print(weightliftinglog.lateralPulldownReps);
      print(weightliftinglog.bicepCurlWeight);
      print(weightliftinglog.bicepCurlReps);
      print(weightliftinglog.tricepExtensionWeight);
      print(weightliftinglog.tricepExtensionReps);

    });

    return Container();
  }
}
