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
import '../util/services/database.dart';
import '../util/package_utils/globals.dart';

class NewLogPage extends StatefulWidget {
  NewLogPage({Key? key, required this.sport }) : super(key: key);
  final Weightlifting sport;
  final TextEditingController date = TextEditingController(text: 'Date: ');

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
            onPressed: () async {
              await DatabaseService(uid: currentUser!.uid).newWeightliftingLog("Weightlifting", DateTime.now(), widget.sport.listExercises);
              Navigator.pop(context);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
        ]);
  }

  Widget _buildList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      itemCount: widget.sport.listExercises.length,
      itemBuilder: (BuildContext context, int index) {
        return StatButton(
          text: widget.sport.listExercises[index].name,
          onPressed: () async {
            _awaitReturnValueFromSecondScreen(context, index);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context, int index) async {

    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StatEntryPage(
            text: "Weightlifting",
            exercise: widget.sport.listExercises[index],
            text1: TextEditingController(text: widget.sport.listExercises[index].sets.toString()),
            text2: TextEditingController(text: widget.sport.listExercises[index].reps.toString()),
            text3: TextEditingController(text: widget.sport.listExercises[index].weight.toString()),),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      widget.sport.listExercises[index] = result;
    });
  }
}
