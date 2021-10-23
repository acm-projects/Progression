import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/stat_button.dart';
import 'package:progression/pages/metric_selection.dart';
import '../UI/background.dart';
import 'package:progression/UI/option_selector.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';

class StatEntryPage extends StatefulWidget {
  const StatEntryPage({Key? key, required this.text}): super(key: key);
  final String text;

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
      Text(
      widget.text, style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center,
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
                Text('Sets', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            const SizedBox(
              height: 42,
              width: 160,


              child: TextEntry(hint: ' '),

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
                Text('Reps', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            const SizedBox(
              height: 42,
              width: 160,


              child: TextEntry(hint: ' '),

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
                Text('Weight', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,

              ),
            ),
            const SizedBox(
              height: 42,
              width: 160,


              child: TextEntry(hint: ' '),

            ),

          ]
      ),

      //const Padding(padding: EdgeInsets.symmetric(vertical: 70.0),),










            ]



          ),

      Align(
      alignment: Alignment.bottomCenter,
        child:
          PageChangeButton(
          width: 140.0,
          height: 50.0,
          text: "Save",
            onPressed: () {
            Navigator.pop(context); // temp holder for testing
            },
          )
      )
        ]

    );
  }
}