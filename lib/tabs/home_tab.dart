import 'dart:core';
import 'package:draw_graph/draw_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progression/UI/graph.dart';
import 'package:progression/util/exercise.dart';
import '../UI/background.dart';
import '../UI/swiper.dart';
import '../util/package_utils/globals.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);



  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {

    return Stack (
      alignment: Alignment.center,

      children: [
        const Background(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Stat Page',
              style: Theme.of(context).textTheme.headline1,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15),),

            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface
                      ),
                  ),
                  MakeSwiper(
                      steps: list,

                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0))
          ],
        ),
      ],
    );
  }
}

List<Widget> returnGraphs () {
  List<Widget> listWidget = [];
  for (var element in currentUserSelf.exercises[0]) {
    if (element.selected == true)
    {
      listWidget.add (
        GraphScreen(
          features: returnList(element.name)
        ),
      );
    }
  }
  return listWidget;
}
