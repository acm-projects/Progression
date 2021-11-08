import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key, required this.features, required this.text}) : super(key: key);

  final List<Feature> features;
  final String text;

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Text(widget.text),
          SizedBox(
            height: 300,
              width: 400,
              child: LineGraph(
                features: widget.features,
                size: const Size(400, 250),
                labelX: const ['11/1', '11/05', '11/10', '11/15', '11/20'],
                labelY: const ['0', '50', '100', '150', '200'],
                showDescription: false,
                graphColor: Colors.black87,


              ),
          ),
        ],
      ),
    );
  }
}