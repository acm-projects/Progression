import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class OptionSelector extends StatefulWidget {
  const OptionSelector({Key ? key, this.width = 348, this.height = 46, this.text = 'text', required this.entries}) : super (key: key);

  final double width;
  final double height;
  final String text;
  final List<String> entries;

  @override
  _OptionSelectorState createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {

  bool selected = false;

  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              if(selected) {
                widget.entries.remove(widget.text);
              } else {
                widget.entries.add(widget.text);
              }
              selected = !selected;

            });
          },
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                color: selected ? Colors.white.withOpacity(1) : Colors.white.withOpacity(.7),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
                child: Text(widget.text, style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center)
          )
        )
      ]
    );
  }
}
