import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  // Builds a simple background gradient from primary to secondary color

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration (
        color: Theme.of(context).colorScheme.background,
        /*
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ]
            */
      ),
    );
  }
}