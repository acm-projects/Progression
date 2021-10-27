import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary/models/weightlifting.dart';

class SwimingLogList extends StatefulWidget {
  const SwimingLogList({Key? key}) : super(key: key);

  @override
  _SwimingLogListState createState() => _SwimingLogListState();
}

class _SwimingLogListState extends State<SwimingLogList> {
  @override
  Widget build(BuildContext context) {

    /*final logs = Provider.of<List<Weightlifting?>>(context);
    logs.forEach((weightlifting) {
      print(swimming!.date);
      print(swimming.sport);
      print(swimming.splitTime);
      print(swimming.setTime);
      print(swimming.warmupDistance);
      print(swimming.workoutDistance);
      print(swimming.warmdownDistance);
      print(swimming.repeats);
      print(swimming.drylands);
    });*/

    return Container();
  }
}