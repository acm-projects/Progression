import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/stat_button.dart';
import 'package:progression/pages/stat_entry_page.dart';
import 'package:progression/util/package_utils/custom_theme.dart';
import '../UI/page_change_button.dart';
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
  DateTime valueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,


        children: [
          Text(
            'New Log',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomTheme(
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
                  child: Text("${valueDate.day.toString().padLeft(2,'0')}-${valueDate.month.toString().padLeft(2,'0')}-${valueDate.year}", style: Theme.of(context).textTheme.headline4,),
                ),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 2.5,
                      ),
                    )),
                width: 270,
              ),
            ),
            ElevatedButton(
              child: const Icon(Icons.date_range),
              onPressed: () => _selectDate(context),
            )
          ]),
          Expanded(
            child: _buildList(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
          ),
          PageChangeButton(
            width: 100.0,
            height: 50.0,
            text: "Save",
            color: const Color.fromRGBO(253, 103, 4, 1.0),
            onPressed: () async {
              await DatabaseService(uid: currentUser!.uid).newWeightliftingLog("Weightlifting", DateTime.now(), widget.sport.listExercises);

              tabController.index = 0;
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
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
          width: 150,
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


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: valueDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2030, 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(253, 103, 4, 1.0), // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Color.fromRGBO(128, 128, 128, 1), // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != valueDate) {

      setState(() {
        valueDate = picked;
      });
    }
  }
}
