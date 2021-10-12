import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/login_page.dart';

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
            primary: Color.fromRGBO(125, 205, 172, 1.0),
            // Other blue color we were using as accent
            secondary: Color.fromRGBO(35, 119, 123, 1),
            // A transparent color
            background: Color.fromRGBO(1, 1, 1, 0.0),
            // The Button Color
            surface: Color.fromRGBO(204, 204, 204, 100)
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
          // A smaller body size
          bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Open Sans'),
          // Slightly larger body size
          bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Open Sans'),
        ),
      ),

      // The page your testing
      // Will eventually be the starting page
      home: const LoginPage(),

    );
  }
}