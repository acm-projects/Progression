import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/stat_button.dart';
import 'package:progression/pages/stat_entry_page.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';
import '../UI/background.dart';
import '../util/weightlifting.dart';

class NewLogPage extends StatefulWidget {
  NewLogPage({Key? key, required this.sport }) : super(key: key);
  final Weightlifting sport;

  final TextEditingController date = TextEditingController(text: 'Password');

  @override
  State createState() => NewLogPageState();
}

class NewLogPageState extends State<NewLogPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,


        children: [
          const Background(), //need help

          Text(
            'New Log',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 70,
              height: 30,
              child: Container(
                child: Text('Date: ',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            const Padding(padding: EdgeInsets.only(
              right: 10.0,
            ),),
            SizedBox(
              height: 42,
              width: 160,
              child: TextEntry(
                hint: ' ',
                text: widget.date,
                onChanged: (hint) {},
              ),
            ),
          ]),
          Expanded(
            child: _buildList(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
          ),
          PageChangeButton(
            width: 140.0,
            height: 50.0,
            text: "Save",
            onPressed: () {
              Navigator.pop(context); // temp holder for testing
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
        ]);
  }

  Widget _buildList() {
    // final List<String> entries = <String>['Bench Press', 'Squat', 'Deadlift', 'Shoulder Press', 'Pull-ups',
    //   'Dumbbell Bench Press', 'Barbell Curl', 'Dumbell Curl', 'Front Squat', 'Bent-over Rows', 'Push-ups', 'Dumbell Shoulder Press'];
    // final List<String> selected = <String>[];
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      itemCount: widget.sport.list.length,
      itemBuilder: (BuildContext context, int index) {
        return StatButton(
          text: widget.sport.list[index].name,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StatEntryPage(text: widget.sport.list[index].name, exercise: widget.sport.list[index],)),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
