import 'package:flutter/material.dart';
import 'package:temporary/models/user.dart';
import 'package:temporary/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:temporary/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthService().user,
        initialData: null,
        child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

