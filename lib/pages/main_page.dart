import 'package:draw_graph/models/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progression/UI/graph.dart';
import '../tabs/all_tabs.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static final List<Widget> _list = [
    HomeTab(list: [
      Graph(
        features: [
          Feature(
            title: "Drink Water",
            color: Colors.blue,
            data: [0.2, 0.8, 0.4, 0.7, 0.6],
          ),
        ],
      ),
      ],
    ),
    const CalendarTab(),
    const NewLogTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.graph_square), label: 'Stats'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: 'Calendar'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.plus_circle), label: 'New Log'),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _list[index];
          },
      ),
    );
  }
}
