import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../UI/background.dart';
import '../UI/swiper.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key, required this.list}) : super(key: key);

  final List<Widget> list;

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {

    return Stack (
      children: [
        const Background(),

        SizedBox(

          child: MakeSwiper(
            steps: widget.list,
          ),
        ),
      ],
    );
  }
}
