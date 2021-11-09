import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../UI/page_change_button.dart';
import '../UI/background.dart';

class CalendarStatPage extends StatefulWidget {
  const CalendarStatPage(
      {Key? key,
      required this.exercise,
      this.sets = 2,
      this.reps = 15,
      this.weight = 35})
      : super(key: key);
  final String exercise;
  final int sets;
  final int reps;
  final int weight;

  @override
  State createState() => CalendarStatPageState();
}

class CalendarStatPageState extends State<CalendarStatPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
      const Background(),

      GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0),
          transformAlignment: Alignment.topLeft,
          child: const Icon(CupertinoIcons.arrow_left_circle, size: 45),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),

      Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
        ),
        Container(
          width: 370,
          height: 70,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(253, 103, 4, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            widget.exercise,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,

          ),
          //color: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        Text(
          widget.sets.toString(),
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        Text(
          "Sets",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        Text(
          widget.reps.toString(),
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        Text(
          "Reps",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        Text(
          widget.weight.toString(),
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        Text(
          "Weight",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        PageChangeButton(
          width: 140.0,
          height: 50.0,
          color: Theme.of(context).colorScheme.onPrimary,
          text: "Exercises",
          onPressed: () {
            Navigator.pop(context); // temp holder for testing
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ])
    ]);
  }
}
