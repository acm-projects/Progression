import 'package:flutter/material.dart';
import 'package:temporary/models/sport.dart';
import 'package:temporary/models/weightliftingLog.dart';
import 'package:temporary/screens/home/weightlifting_log_list.dart';
import 'package:temporary/services/auth.dart';
import 'package:temporary/services/database.dart';
import 'package:provider/provider.dart';
import 'package:temporary/screens/home/user_list.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<WeightliftingLogs?>>.value(
      value: DatabaseService(uid: '').WLlogs,
      initialData: [],
      child: Scaffold(
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
        body: WeightliftingLogList(),
      ),
    );
  }

}
