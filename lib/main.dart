import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import './pages/main_page.dart';

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(

        // All Theme data can be implemented as
        // Theme.of(context).colorscheme.background
        // Where colorscheme is the section
        // And background is the option choice

        // Can all be adjusted at will,
        // Still more slots if we need to add more colors or accents
        colorScheme: const ColorScheme.highContrastLight(
            // Primary green color
          primary: Color.fromRGBO(255, 208, 138, 1.0),
            // Other blue color we were using as accent
          secondary: Color.fromRGBO(253, 84, 47, 1),
            // A transparent color
          background: Color.fromRGBO(1, 1, 1, 0.0),
            // The Button Color
          surface: Color.fromRGBO(250, 250, 250, 1),
            // A solid black Color
          onBackground: Color.fromRGBO(0, 0, 0, 1),
        ),

        // Define the default font family
        fontFamily: 'Montserrat',
        // Define the default 'Text Theme'
        // Specifies certain height, and weights
        textTheme: const TextTheme(
          // Header Font
          headline1: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          // Smaller Header Font
          headline2: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          // Headline font that is underlined
          headline3: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
          // A smaller body size
          bodyText1: TextStyle(fontSize: 24.0, fontFamily: 'Open Sans'),
          // Slightly larger body size
          bodyText2: TextStyle(fontSize: 20.0),
        ),
      ),

      // The page your testing
      // Will eventually be the starting page
      home: const MainPage(),

    );
  }
}