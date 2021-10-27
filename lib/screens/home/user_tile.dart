import 'package:temporary/models/sport.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final Sport sport;
  UserTile(this.sport, {users});
  //const UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[100],
          ),
          title: Text(sport.name),
          subtitle: Text('User plays ${sport.sport}'),
        ),
      ),
    );
  }
}

