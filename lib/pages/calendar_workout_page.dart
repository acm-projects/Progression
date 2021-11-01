import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/option_selector.dart';
import 'package:progression/UI/stat_button.dart';
import 'package:progression/pages/stat_entry_page.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';
import '../UI/background.dart';
import 'calendar_stat_page.dart';

class CalendarWorkoutPage extends StatefulWidget {
  CalendarWorkoutPage({Key? key, required this.date, required this.entries}) : super(key: key);
  final int date;
  final List<String> entries;
  @override
  State createState() => CalendarWorkoutPageState();
}

class CalendarWorkoutPageState extends State<CalendarWorkoutPage> {

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,

      children: [
        const Background(),

        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),

            Text(
              widget.date.toString(),
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),

            Expanded(child: _buildList()),

          ],

        )
      ]
    );
  }


  Widget _buildList() {
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
              MaterialPageRoute(
                  builder: (context) =>
                      CalendarStatPage(exercise: widget.entries[index],)),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}