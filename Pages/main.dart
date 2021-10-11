import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        // Define the default Brightness
        brightness: Brightness.dark,
        colorScheme: ColorScheme.highContrastLight(
            primary: Color.fromRGBO(125, 205, 172, 1),
            secondary: Color.fromRGBO(35, 119, 123, 1)
        ),

        // Define the default font family
        fontFamily: 'Montserrat',

        // Define the default 'Text Theme'
        // Specifies certain height, and weights
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Open Sans'),
          ),
        ),

        home: Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ]
                )
              ),
            )
          ),
        ),
    );
  }
}



