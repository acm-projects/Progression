import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:progression/util/package_utils/globals.dart';
import 'package:progression/util/services/database.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late Future<List<double>> getData;

  @override
  void initState() {
    super.initState();
    getData = returnData();
    print('This is the data: $getData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Text(
              widget.text,
              style: Theme.of(context).textTheme.headline3,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            FutureBuilder<List<double>>(
                future: getData,
                builder: (context, AsyncSnapshot<List<double>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == null) {
                      return const Text('No Data');
                    } else {
                      return SizedBox(
                        height: 450,
                        width: 500,
                        child: LineGraph(
                          features: [
                            Feature(
                              data: snapshot.data ?? [0, .4, .3, .6],
                            ),
                          ],
                          size: const Size(500, 500),
                          labelX: const [
                            '11/1',
                            '11/05',
                            '11/10',
                            '11/15',
                            '11/20'
                          ],
                          labelY: const ['0', '50', '100', '150', '200'],
                          showDescription: false,
                          graphColor: Colors.black87,
                        ),
                      );
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ],
    ));
  }

  Future<List<double>> returnData() async {
    return await DatabaseService(uid: currentUser!.uid).returnList(widget.text);
  }
}
