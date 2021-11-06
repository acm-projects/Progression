import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tabs/all_tabs.dart';
import '../util/package_utils/globals.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  static final List<Widget> _list = [
    HomeTab(),
    const CalendarTab(),
    const NewLogTab(),
  ];

  @override
  void initState () {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        controller: tabController,
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
