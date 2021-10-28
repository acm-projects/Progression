import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/util/services/auth.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  final TextEditingController emailText = TextEditingController(text: 'Email');
  final TextEditingController passwordText = TextEditingController(text: 'Password');
  final TextEditingController password2Text = TextEditingController(text: 'Password');

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();

}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        const Background(),

        GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(left: 30.0, top: 60.0),
            transformAlignment: Alignment.topLeft,
            child: const Icon(CupertinoIcons.arrow_left_circle, size: 45),
          ),
          onTap: () {
            Navigator.pop(context);
          },
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

            const Padding(padding: EdgeInsets.symmetric(vertical: 30.0),),

            Text(
              error,
              style: Theme.of(context).textTheme.bodyText1,
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),

            SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Email', text: widget.emailText,),

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

            SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Password', text: widget.passwordText,),

            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

            SizedBox(
              height: 42,
              width: 253,

              // Might need to add this color if background isn't already transparent
              // color: Theme.of(context).colorScheme.background,

              child: TextEntry(hint: 'Confirm Password', text: widget.password2Text,),

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

            PageChangeButton(
              key: _formKey,
              width: 140.0,
              height: 50.0,
              text: "Create",
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  dynamic result = await _auth.registerWithEmailAndPassword(widget.emailText.text, widget.passwordText.text);
                  if (result == null) {
                    error = 'No user found with that email and password';
                  }
                  else {
                    Navigator.pop(context);
                  }
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}