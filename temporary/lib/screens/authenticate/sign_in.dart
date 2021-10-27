import 'package:flutter/material.dart';
import 'package:temporary/services/auth.dart';
import 'package:temporary/shared/constants.dart';
import 'package:temporary/shared/load_page.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);

  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign in to Progression'),
          actions: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.white, // foreground
              ),
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 14.5, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val!.isEmpty ? 'Enter a password' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[400], // foreground
                    ),
                    child: Text('Sign in',
                        style: TextStyle(color: Colors.white)
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null){
                          setState(() {
                            error = 'No user found with that email and password';
                            loading = false;
                          });
                        }
                      }
                    }
                ),
                SizedBox(height: 5.0),
                Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 10.0)
                ),
              ],
            ),
          ),
        )
    );
  }
}