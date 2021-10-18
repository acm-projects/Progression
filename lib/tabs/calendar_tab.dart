import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../UI/background.dart';

class CalendarTab extends StatelessWidget {
  const CalendarTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: const [
        Background(),

        Text('Calendar')
      ],
    );
  }
}