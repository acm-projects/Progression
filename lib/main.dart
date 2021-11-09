import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:progression/pages/login_page.dart';
import 'package:progression/util/package_utils/globals.dart';
import 'package:progression/util/services/auth.dart';
import 'package:progression/util/user.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  tabController = CupertinoTabController();
  //setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamProvider<Users?>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          theme: ThemeData(

            // All Theme data can be implemented as
            // Theme.of(context).colorscheme.background
            // Where colorscheme is the section
            // And background is the option choice

            // Can all be adjusted at will,
            // Still more slots if we need to add more colors or accents
            colorScheme: const ColorScheme.highContrastLight(
              // Primary green color
              primary: Color.fromRGBO(253, 103, 4, 1.0),
              // Other blue color we were using as accent
              secondary: Color.fromRGBO(253, 84, 47, 1),
              // A transparent color
              background: Color.fromRGBO(54, 54, 57, 1),
              // The Button Color
              surface: Color.fromRGBO(250, 250, 250, 1),
              // A solid black Color
              onBackground: Color.fromRGBO(0, 0, 0, 1),

              onSurface: Color.fromRGBO(255,255,255,1),

              onSecondary: Color.fromRGBO(128, 128, 128, 1)
            ),

            // Define the default font family
            fontFamily: 'Montserrat',
            // Define the default 'Text Theme'
            // Specifies certain height, and weights
            textTheme: TextTheme(
              // Header Font
              headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.surface),
              // Smaller Header Font
              headline2: const TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
              // Headline font that is underlined
              headline3: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),

              headline4: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),

              headline5: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(253, 103, 4, 1.0)),

              // A smaller body size
              bodyText1: const TextStyle(fontSize: 24.0, fontFamily: 'Open Sans',),
              // Slightly larger body size
              bodyText2: TextStyle(fontSize: 20.0, color: Theme.of(context).colorScheme.onSurface),

              button: TextStyle(fontSize: 32.0, fontFamily: 'Open Sans', color: Theme.of(context).colorScheme.onBackground),
            ),
          ),

          // The page your testing
          // Will eventually be the starting page
          home: LoginPage(),

        )
    );
  }
/*
  Widget _getStartUpScreen () {
    var storageService = locator<LocalStorageService>();
    if (storageService.user.rememberMe == false) {
      return LoginPage();
    }
    else {
      return const MainPage();
    }
  }

 */
}


