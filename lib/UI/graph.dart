import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

class Graph extends StatelessWidget {
  Graph({Key? key}) : super(key: key);

  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: Colors.blue,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
    Feature(
      title: "Exercise",
      color: Colors.pink,
      data: [1, 0.8, 0.6, 0.7, 0.3],
    ),
    Feature(
      title: "Study",
      color: Colors.cyan,
      data: [0.5, 0.4, 0.85, 0.4, 0.7],
    ),
    Feature(
      title: "Water Plants",
      color: Colors.green,
      data: [0.6, 0.2, 0, 0.1, 1],
    ),
    Feature(
      title: "Grocery Shopping",
      color: Colors.amber,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 64.0),
          child: Text(
            "Tasks Track",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        Expanded(
          child: LineGraph(
            features: features,
            labelX: const ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
            labelY: const ['20%', '40%', '60%', '80%', '100%'],
            showDescription: true,
            graphColor: Colors.white30,
            graphOpacity: 0.2,
            verticalFeatureDirection: true,
            descriptionHeight: 130,
            size: const Size(50,50)
          ),
          flex: 6,
        ),
        const Expanded(
          child: SizedBox(
            height: 50,
          ),
          flex: 2,
        ),
      ],
    );
  }

}