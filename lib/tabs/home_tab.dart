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

            const Padding(padding: EdgeInsets.symmetric(vertical: 5),),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 5),),

            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface
                      ),
                  ),
                  MakeSwiper(
                      steps: widget.list

                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
