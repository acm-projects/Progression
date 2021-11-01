import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../UI/page_change_button.dart';
import '../UI/background.dart';

class CalendarStatPage extends StatefulWidget {
  const CalendarStatPage({Key? key, required this.exercise, this.sets = 0, this.reps = 0, this.weight = 0}): super(key: key);
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
        alignment: Alignment.center,
      children: [
        const Background(),
        Column(

          children: [

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
            ),


            Container(
            height: 135,
            width: 500,
            alignment: Alignment.center,
            child:
            Text(
              widget.exercise,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
              ),
              //),

            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 15.0),
            // ),

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
              padding: EdgeInsets.symmetric(vertical: 11.0),
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
              padding: EdgeInsets.symmetric(vertical: 11.0),
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
              text: "Exercises",
              onPressed: () {
                Navigator.pop(context); // temp holder for testing
              },
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
            ),

          ]



        )
      ]
    );
  }

}