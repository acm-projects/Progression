import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/stat_button.dart';
import '../UI/background.dart';
import 'calendar_stat_page.dart';

class CalendarWorkoutPage extends StatefulWidget {
  const CalendarWorkoutPage(
      {Key? key, required this.date, required this.entries})
      : super(key: key);
  final String date;
  final List<String> entries;

  @override
  State createState() => CalendarWorkoutPageState();
}

class CalendarWorkoutPageState extends State<CalendarWorkoutPage> {
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
              widget.date,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            //color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 7.0),
          ),
          Expanded(child: _buildList()),
        ],
      )
    ]);
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
                  builder: (context) => CalendarStatPage(
                        exercise: widget.entries[index],
                      )),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
