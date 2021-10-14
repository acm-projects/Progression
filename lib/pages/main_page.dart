import 'package:flutter/material.dart';
import '../UI/background.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Padding(padding: EdgeInsets.symmetric(vertical: 40.0)),

            Text(
              'Your Progress',
              style: Theme.of(context).textTheme.headline1,
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),

            SizedBox(
              width: 360,
              height: 1,
              child: Container(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),

            Text(
              'Dead lift',
              style: Theme.of(context).textTheme.headline2,
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),

            Text(
              'Your Goal: 220',
              style: Theme.of(context).textTheme.bodyText2,
            ),

            SizedBox(
              child: Row(),
            ),

            SizedBox(
              child: Row(),
            ),
          ],
        ),
      ],
    );
  }
}
