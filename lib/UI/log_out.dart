import 'package:flutter/cupertino.dart';
import 'package:restart_app/restart_app.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);



  @override
  State<StatefulWidget> createState() {
    return _LogOutState();
  }

}

class _LogOutState extends State<LogOut> {

  @override
  void initState() {
    super.initState();
    Restart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}