import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';
import './create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Background(),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ' It takes 10,000 hours to become a master in something.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 36.0)),

            Container(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 42,
                    width: 253,

                    // Might need to add this color if background isn't already transparent
                    // color: Theme.of(context).colorScheme.background,

                    child: TextEntry(hint: 'Email'),
                  ),

                  const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                  const SizedBox(
                    height: 42,
                    width: 253,

                    // Might need to add this color if background isn't already transparent
                    // color: Theme.of(context).colorScheme.background,

                    child: TextEntry(hint: 'Password'),
                  ),

                  const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

                  PageChangeButton(
                    width: 140.0,
                    height: 50.0,
                    text: "Sign In",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

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

            PageChangeButton(
              width: 140.0,
              height: 50.0,
              text: "Create",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                );
              },
            ),

          ],
        ),
      ]
    );
  }
}