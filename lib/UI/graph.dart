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
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
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
            graphColor: Colors.white30,
            graphOpacity: 0.2,
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