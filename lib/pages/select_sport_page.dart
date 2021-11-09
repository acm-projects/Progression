import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/UI/option_selector.dart';
import 'package:progression/pages/metric_selection.dart';
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 7.0),),

            Container (
              width: 370,
              height: 100,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:
              Text(
                'Which sport would you like to track?',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              //color: Colors.white,

            ),

            Expanded(child: _buildList()),


            PageChangeButton(
              height: 50.0,
              width: 140.0,
              text: "Select",
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MetricSelectionPage(entries: ['apple'])),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
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
        return OptionSelector(text: entries[index],entries: selected);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
      }

  }



