import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextEntry extends StatefulWidget {
  const TextEntry({Key ? key, this.hint = 'hint'}) : super (key: key);

  final String hint;

  @override
  _TextEntryState createState() => _TextEntryState();
}

class _TextEntryState extends State<TextEntry> {
  late TextEditingController _textController;


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.hint);
  }

  @override
Widget build(BuildContext context) {
    return CupertinoTextField.borderless(
      controller: _textController,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}