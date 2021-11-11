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
  late Future<List<dynamic>> getData;

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
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 35.0, color: Theme.of(context).colorScheme.primary),
            ),
            //const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            FutureBuilder<List<dynamic>>(
                future: getData,
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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
                              data: snapshot.data![0],
                            ),
                          ],
                          size: const Size(500, 500),
                          labelX: const [
                            '1',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '10',
                            '12',
                            '13',
                            '14',
                            '16',
                            '17',
                          ],
                          labelY: snapshot.data![1],
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

  Future<List<dynamic>> returnData() async {
    return await DatabaseService(uid: currentUser!.uid).returnList(widget.text);
  }
}
