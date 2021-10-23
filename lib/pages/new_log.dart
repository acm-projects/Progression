import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/stat_button.dart';
import 'package:progression/pages/metric_selection.dart';
import 'package:progression/pages/stat_entry_page.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';

class NewLogPage extends StatefulWidget {
  const NewLogPage({Key? key, required this.entries}): super(key: key);
  final List<String> entries;

  @override
  State createState() => NewLogPageState();
}

class NewLogPageState extends State<NewLogPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          const Background(),

          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'New Log', style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center,
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: 70,
                  height: 30,
                  child: Container(
                    child:
                    Text('Date', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center),
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

              Expanded(child: _buildList()),

                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

              PageChangeButton(
                width: 140.0,
                height: 50.0,
                text: "Save",
                onPressed: () {
                  Navigator.pop(context); // temp holder for testing
                },
              ),
              ]
        )
      ],
    );
  }

  Widget _buildList() {
    // final List<String> entries = <String>['Bench Press', 'Squat', 'Deadlift', 'Shoulder Press', 'Pull-ups',
    //   'Dumbbell Bench Press', 'Barbell Curl', 'Dumbell Curl', 'Front Squat', 'Bent-over Rows', 'Push-ups', 'Dumbell Shoulder Press'];
    // final List<String> selected = <String>[];
    String input = '';
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      itemCount: widget.entries.length,
      itemBuilder: (BuildContext context, int index) {
        return StatButton(
          text: widget.entries[index],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatEntryPage(text: widget.entries[index])),
            );
          },

        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

