import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/util/exercise.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';

class StatEntryPage extends StatefulWidget {
  const StatEntryPage({Key? key, required this.text, required this.exercise, required this.text1, required this.text2, required this.text3}): super(key: key);
  final String text;
  final Exercise exercise;
  final TextEditingController text1;
  final TextEditingController text2;
  final TextEditingController text3;

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
      const Padding(padding: EdgeInsets.symmetric(vertical: 30.0),),

      Container(
        width: 380,
        height: 120,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), borderRadius: const BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
      child:
        Text(
        widget.text, style: const TextStyle(fontSize: 40, fontFamily: 'Heebo-Light', fontWeight: FontWeight.w500, color: Colors.black, decoration: TextDecoration.none), textAlign: TextAlign.center,
        ),
      ),

      const Padding(padding: EdgeInsets.symmetric(vertical: 17.0),),

      Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Container(
                child:
                Text('Sets',
                    style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30.0, color: Color.fromRGBO(253, 103, 4, 1.0), decoration: TextDecoration.none),
                    textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            SizedBox(
              height: 42,
              width: 250,


              child: TextEntry(
                hint: '0',
                text: widget.text1,
                  onChanged: (hint) {},
              ),

            ),

          ]
      ),

      const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),


      Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Container(
                child:
                Text('Reps',
                    style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30.0, color: Color.fromRGBO(253, 103, 4, 1.0), decoration: TextDecoration.none),
                    textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            SizedBox(
              height: 42,
              width: 250,


              child: TextEntry(
                hint: '0',
                text: widget.text2,
                onChanged: (hint) {},
              ),

            ),

          ]
      ),

      const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),



      Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Container(
                child:
                Text('Weight',
                    style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30.0, color: Color.fromRGBO(253, 103, 4, 1.0), decoration: TextDecoration.none),
                    textAlign: TextAlign.left),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            SizedBox(
              height: 42,
              width: 250,


              child: TextEntry(
                hint: '0',
                text: widget.text3,
                onChanged: (hint) {},
              ),

            ),
          ]
      ),

      const Spacer(),

      // Align(
      //     alignment: Alignment.bottomCenter,
      //     child:
          PageChangeButton(
            width: 140.0,
            height: 50.0,
            text: "Save",
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              Navigator.pop(context, Exercise(
                name: widget.exercise.name,
                weight: int.parse(widget.text3.text),
                reps: int.parse(widget.text2.text),
                sets: int.parse(widget.text1.text)
              )); // temp holder for testing
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