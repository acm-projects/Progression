import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary/models/weightlifting.dart';

class WeightliftingLogList extends StatefulWidget {
  const WeightliftingLogList({Key? key}) : super(key: key);

  @override
  _WeightliftingLogListState createState() => _WeightliftingLogListState();
}

class _WeightliftingLogListState extends State<WeightliftingLogList> {
  @override
  Widget build(BuildContext context) {

    /*final logs = Provider.of<List<Weightlifting?>>(context);
    logs.forEach((weightlifting) {
      print(weightlifting!.date);
      print(weightlifting.sport);
      print(weightlifting.deadLiftWeight);
      print(weightlifting.deadLiftReps);
      print(weightlifting.backSquatWeight);
      print(weightlifting.backSquatReps);
      print(weightlifting.hipThrustWeight);
      print(weightlifting.hipThrustReps);
      print(weightlifting.legPressWeight);
      print(weightlifting.legPressReps);
      print(weightlifting.benchPressWeight);
      print(weightlifting.benchPressReps);
      print(weightlifting.lateralPulldownWeight);
      print(weightlifting.lateralPulldownReps);
      print(weightlifting.bicepCurlWeight);
      print(weightlifting.bicepCurlReps);
      print(weightlifting.tricepExtensionWeight);
      print(weightlifting.tricepExtensionReps);
    });*/

    return Container();
  }
}