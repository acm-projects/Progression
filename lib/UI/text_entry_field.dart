import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextEntry extends StatefulWidget {

  const TextEntry({Key ? key, this.hint = 'hint', required this.text, required this.onChanged}) : super (key: key);

  final String hint;
  final TextEditingController text;
  final Function(String) onChanged;


  @override
  _TextEntryState createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      controller: widget.text,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.bodyText2,
      placeholder: widget.hint,
      onTap: () {
        if (widget.text.text == widget.hint) {
          widget.text.clear();
        }
      },
      onChanged: widget.onChanged,

    );
  }
}