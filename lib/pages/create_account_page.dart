import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        const Background(),

        Container(
          padding: const EdgeInsets.only(left: 30.0, top: 60.0),
          transformAlignment: Alignment.topLeft,
          child: const Icon(CupertinoIcons.arrow_left_circle, size: 45),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),

            Text(
              'Create Account',
              style: Theme.of(context).textTheme.headline1,
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 35.0),),

            const SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Email'),

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

            const SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Username'),

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

            const SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Password'),

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

            const SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Confirm Password'),

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: 160,
                  height: 2,
                  child: Container(
                    color: Theme.of(context).colorScheme.onBackground,

                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                SizedBox(
                  width: 160,
                  height: 2,
                  child: Container(
                    color: Theme.of(context).colorScheme.onBackground,

                  ),
                ),
              ],
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

            const PageChangeButton(
              width: 140.0,
              height: 50.0,
              text: "Create",
            ),
          ],
        ),
      ],
    );
  }
}