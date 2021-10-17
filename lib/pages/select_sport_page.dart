import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/option_selector.dart';
import '../UI/background.dart';
import '../UI/page_change_button.dart';

class SelectSportPage extends StatelessWidget {
  const SelectSportPage({Key? key}) : super(key: key);

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
              'Which sports do you want to track?',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),

            Expanded(child: _buildList()),


            PageChangeButton(
              width: 140.0,
              height: 50.0,
              text: "Select",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ]
    );
  }


  Widget _buildList() {
    final List<String> entries = <String>['Swimming', 'Weightlifting', 'Running'];
    final List<String> selected = <String>[];

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return OptionSelector(text: entries[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
      }

  }



