import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporary/screens/authenticate/authenticate.dart';
import 'package:temporary/screens/home/home.dart';
import 'package:temporary/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users?>(context);

    //return either Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}