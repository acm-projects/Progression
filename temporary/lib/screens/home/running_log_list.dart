import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary/models/weightlifting.dart';

class RunningLogList extends StatefulWidget {
  const RunningLogList({Key? key}) : super(key: key);

  @override
  _RunningLogListState createState() => _RunningLogListState();
}

class _RunningLogListState extends State<RunningLogList> {
  @override
  Widget build(BuildContext context) {

    /*final logs = Provider.of<List<Weightlifting?>>(context);
    logs.forEach((weightlifting) {
      print(running!.date);
      print(running.sport);
      print(running.heartrate);
      print(running.runType);
      print(running.calories);
      print(running.effortLevel);
      print(running.time);
      print(running.distance);
    });*/

    return Container();
  }
}