import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import '../UI/background.dart';
import '../UI/text_entry_field.dart';
import '../UI/page_change_button.dart';
import './create_account_page.dart';
import '../util/services/auth.dart';
import '../pages/main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailText = TextEditingController(text: 'Email');
  final TextEditingController passwordText = TextEditingController(text: 'Password');

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Form (
      key: _formKey,
        child: Stack(
            children: <Widget>[
              const Background(),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container (
                    alignment: Alignment.center,
                    width: 350,
                    height: 70,
                    // decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: const BorderRadius.all(Radius.circular(10))
                    // ),
                    child:
                    Text(
                      'Progression',
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    //color: Colors.white,

                  ),
                  // Text(
                  //   'a',
                  //   textAlign: TextAlign.center,
                  //   style: Theme.of(context).textTheme.bodyText1,
                  //
                  // ),

                  const Padding(padding: EdgeInsets.symmetric(vertical: 38.0)),

                  Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.4), borderRadius: const BorderRadius.all(Radius.circular(20))),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          error,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 42,
                          width: 253,
                          //decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: const BorderRadius.all(Radius.circular(20))),
                          //padding: const EdgeInsets.all(12.0),

                          // Might need to add this color if background isn't already transparent
                          // color: Theme.of(context).colorScheme.background,

                          child:
                          TextEntry(
                            hint: 'Email',
                            text: widget.emailText,

                            onChanged: (hint) {}
                            ),
                        ),

                        const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                        SizedBox(
                          height: 42,
                          width: 253,

                          // Might need to add this color if background isn't already transparent
                          // color: Theme.of(context).colorScheme.background,

                          child: TextEntry(
                            hint: 'Password',
                            text: widget.passwordText,
                            onChanged: (hint) {},),
                        ),

                        const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                        PageChangeButton(
                          // width: 253.0,
                          // height: 42.0,
                          text: "Sign In",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result = await _auth.signInWithEmailAndPassword(widget.emailText.text, widget.passwordText.text);

                              if (result == null) {
                                error = 'No user found with that email and password';
                              }
                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MainPage())
                                );
                              }
                            }
                          },
                        ),

                        const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            SizedBox(
                              width: 100,
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
                              width: 100,
                              height: 2,
                              child: Container(
                                color: Theme.of(context).colorScheme.onBackground,

                              ),
                            ),

                          ],
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),

                        PageChangeButton(
                          // width: 253.0,
                          // height: 42.0,
                          text: "Create",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreateAccountPage()),
                            );
                          },
                        ),
                      ],
                    ), //this is the box dont mess up
                  ),

                  const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(
                        width: 320,
                        height: 2,
                        child: Container(
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ),

                  // const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                  //
                  // PageChangeButton(
                  //   // width: 253.0,
                  //   // height: 42.0,
                  //   text: "Create",
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => CreateAccountPage()),
                  //     );
                  //   },
                  // ),

                ],
              ),
            ]
        )
    );
  }
}