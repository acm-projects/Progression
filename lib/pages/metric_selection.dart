import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/option_selector.dart';
import 'package:progression/pages/main_page.dart';
import 'package:progression/pages/test.dart';
import '../UI/background.dart';
import '../UI/page_change_button.dart';

class MetricSelectionPage extends StatefulWidget {
  const MetricSelectionPage({Key? key, required this.entries}): super(key: key);
  final List<String> entries;

  @override
  State createState() => MetricSelectionPageState();
}

class MetricSelectionPageState extends State<MetricSelectionPage> {

  List<String> picked = <String>['app', 'hello'];

  @override
  Widget build(BuildContext context) {


    return Stack(
        children: [

        const Background(),

    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Which metrics do you want to track?',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),

        Expanded(child: _buildList()),

        const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),


        PageChangeButton(
          width: 140.0,
          height: 50.0,
          text: "Select",
          onPressed: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context) => const MainPage())
            );
          },
        ),
      ]
    )
    ]);
  }

  Widget _buildList() {

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      itemCount: widget.entries.length,
      itemBuilder: (BuildContext context, int index) {
        return OptionSelector(text: widget.entries[index], entries: picked,);
      },

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}