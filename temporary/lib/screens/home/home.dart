import 'package:flutter/material.dart';
import 'package:temporary/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Progression'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.white, // foreground
            ),
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },

          )
        ],
      ),
    );
  }
}