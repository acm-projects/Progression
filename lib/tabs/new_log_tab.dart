import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progression/UI/background.dart';
import '../pages/new_log.dart';

class NewLogTab extends StatelessWidget {
  const NewLogTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack (
        children: [
          const Background(),

          Container(
            padding: const EdgeInsets.only(
              top: 50.0,
              bottom: 30.0,
              left: 10.0,
              right: 10.0,

            ),

            child: const NewLogPage(
              entries: [],
            ),

          )
        ],
    );
  }
}