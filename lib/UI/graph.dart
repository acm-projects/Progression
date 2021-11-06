import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key, required this.features}) : super(key: key);

  final List<Feature> features;

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Expanded(
              child: LineGraph(
                features: widget.features,
                size: const Size(400, 300),
                labelX: const ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
                labelY: const ['25%', '45%', '65%', '75%', '85%', '100%'],
                showDescription: false,
                graphColor: Colors.black87,
              ),
          ),
        ],
      ),
    );
  }
}