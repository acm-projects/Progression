import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary/models/sport.dart';
import 'package:temporary/screens/home/user_tile.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Container();


    final users = Provider.of<List<Sport?>>(context);
    /*users.forEach((sport){
      print(sport!.name);
      print(sport!.sport);
      print(sport!.age);
    });*/


    /*return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index){
        return UserTile(sport: users[index]);
      },
    );
  }*/
  }
}
