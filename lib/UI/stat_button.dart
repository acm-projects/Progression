import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatButton extends StatelessWidget {
  const StatButton(
      {Key? key, this.width = 150.0, this.height = 40.0, this.text = 'blank', required this.onPressed }) : super(key: key);


  final double width;
  final double height;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CupertinoButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.zero,
      ),
    );
  }
}