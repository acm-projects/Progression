import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/util/exercise.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';

class StatEntryPage extends StatefulWidget {
  StatEntryPage({Key? key, required this.text, required this.exercise}): super(key: key);
  final String text;
  final Exercise exercise;
  final TextEditingController text1 = TextEditingController(text: '0');
  final TextEditingController text2 = TextEditingController(text: '0');
  final TextEditingController text3 = TextEditingController(text: '0');

  @override
  State createState() => StateEntryPageState();
}

class StateEntryPageState extends State<StatEntryPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        const Background(),

    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Padding(padding: EdgeInsets.symmetric(vertical: 7.0),),

      Container(
        width: 500,
        height: 130,
        alignment: Alignment.center,
      child:
        Text(
        widget.text, style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center,
        ),
      ),

      const Padding(padding: EdgeInsets.symmetric(vertical: 9.0),),

      Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Container(
                child:
                Text('Sets', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            SizedBox(
              height: 42,
              width: 250,


              child: TextEntry(
                hint: widget.exercise.sets.toString(),
                text: widget.text1,
                  onChanged: (hint) {
                    widget.exercise.sets = int.parse(widget.text1.text);
                  },
              ),

            ),

          ]
      ),

      const Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),


      Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Container(
                child:
                Text('Reps', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            SizedBox(
              height: 42,
              width: 250,


              child: TextEntry(
                hint: widget.exercise.weight.toString(),
                text: widget.text2,
                onChanged: (hint) {
                  widget.exercise.weight = int.parse(widget.text2.text);
                },
              ),

            ),

          ]
      ),

      const Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),



      Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Container(
                child:
                Text('Weight', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            SizedBox(
              height: 42,
              width: 250,


              child: TextEntry(
                hint: widget.exercise.reps.toString(),
                text: widget.text3,
                onChanged: (hint) {
                  widget.exercise.reps = int.parse(widget.text3.text);
                },
              ),

            ),




          ]
      ),

      Spacer(),

      // Align(
      //     alignment: Alignment.bottomCenter,
      //     child:
          PageChangeButton(
            width: 140.0,
            height: 50.0,
            text: "Save",
            onPressed: () {
              Navigator.pop(context); // temp holder for testing
            },
          ),
      //),
      const Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),

            ]
          ),
        ]

    );
  }
}