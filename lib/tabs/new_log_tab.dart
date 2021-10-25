import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../UI/background.dart';
import '../pages/new_log.dart';

class NewLogTab extends StatelessWidget {
  const NewLogTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: const [
        Background(),

        NewLogPage(entries: [],)
      ],
    );
  }
}