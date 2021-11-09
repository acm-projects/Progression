import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageChangeButton extends StatelessWidget {
  const PageChangeButton(
      {Key? key, this.width = 253.0, this.height = 50.0, this.text = 'Add', required this.onPressed, required this.color }) : super(key: key);

  final Color color;
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
            style: Theme.of(context).textTheme.button,
          ),
          color: Colors.white,
          padding: EdgeInsets.zero,
        ),
    );
  }
}