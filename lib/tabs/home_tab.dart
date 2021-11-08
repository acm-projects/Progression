import 'dart:core';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progression/UI/graph.dart';
import 'package:progression/util/exercise.dart';
import 'package:progression/util/services/database.dart';
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
            Container (
              width: 310,
              height: 80,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:
              Text(
                'Stat Page',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              //color: Colors.white,

            ),

            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: 2,
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.onBackground,
            //     ),
            //   ),
            // ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15),),

            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                  ),
                  MakeSwiper(
                      steps: returnGraphs(),

                  ),
                ],
              ),
            ),
            //const Padding(padding: EdgeInsets.symmetric(vertical: 20.0))
          ],
        ),
      ],
    );
  }
}

List<Widget> returnGraphs () {
  List<Widget> listWidget = [];
  for (var element in currentUserSelf.exercises[0]) {
      listWidget.add (
        GraphScreen(
          features: [
            Feature (
              title: element.name,
              data: DatabaseService(uid: currentUser!.uid).returnList(element.name),
            )
          ]
        ),
      );
  }
  return listWidget;
}
