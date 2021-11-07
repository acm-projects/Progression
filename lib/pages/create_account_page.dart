import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:progression/util/services/auth.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';
import '../util/weightlifting.dart';
import './metric_selection.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  final TextEditingController emailText = TextEditingController(text: 'Email');
  final TextEditingController passwordText = TextEditingController(
      text: 'Password');
  final TextEditingController password2Text = TextEditingController(
      text: 'Password');

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();

}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[

            const Background(),

            GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
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

                Text(
                  'Create Account',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1,
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 15.0),),

                Text(
                  error,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0),),

                SizedBox(
                  height: 42,
                  width: 270,

                  // Might need to add this color if background isn't already transparent
                  // color: Theme.of(context).colorScheme.background,

                  child: TextEntry(
                    hint: 'Email',
                    text: widget.emailText,
                    onChanged: (hint) {},),

                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0),),

                SizedBox(
                  height: 42,
                  width: 270,

                  // Might need to add this color if background isn't already transparent
                  // color: Theme.of(context).colorScheme.background,

                  child: TextEntry(
                    hint: 'Password',
                    text: widget.passwordText,
                    onChanged: (hint) {},),

                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 25.0),),

                SizedBox(
                  height: 42,
                  width: 270,

                  // Might need to add this color if background isn't already transparent
                  // color: Theme.of(context).colorScheme.background,

                  child: TextEntry(
                    hint: 'Password',
                    text: widget.password2Text,
                    onChanged: (hint) {},),

                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 20.0),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(
                      width: 160,
                      height: 2,
                      child: Container(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onBackground,

                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Text(
                      'or',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    SizedBox(
                      width: 160,
                      height: 2,
                      child: Container(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onBackground,

                      ),
                    ),
                  ],
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                PageChangeButton(
                  width: 140.0,
                  height: 50.0,
                  text: "Create",
                  onPressed: () async {
                    if (widget.passwordText.text == widget.password2Text.text){
                      if (_formKey.currentState!.validate ()) {
                        dynamic result = await _auth.registerWithEmailAndPassword(widget.emailText.text, widget.passwordText.text);
                        if (result == null) {
                          error = 'Badly Formatted Email';
                          }
                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MetricSelectionPage(entries: Weightlifting.listNames,)),
                          );
                        }
                      }
                    }
                    else {
                      error = "Make sure your passwords match";
                    }
                  },
                ),
              ],
            ),
          ],
        )
    );
  }
}