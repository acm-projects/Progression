import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../UI/calendar.dart';
import '../UI/background.dart';

class CalendarTab extends StatelessWidget {
  const CalendarTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        const Background(),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 20),),

            Text(
              'Calendar',
              style: Theme.of(context).textTheme.headline1,
            ),

            const SizedBox(
              height: 700,
              width: 375,
              child: TableComplexExample(),
            )

          ],
        ),
      ],
    );
  }
}