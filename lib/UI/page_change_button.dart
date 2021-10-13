import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageChangeButton extends StatelessWidget {
  const PageChangeButton({Key? key, this.width = 100.0, this.height = 100.0, this.text = 'Add'}) : super(key: key);
  
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: CupertinoButton(
          onPressed: () {  },
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.zero,
        ),
    );
  }
}