import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/exercise.dart';

class Weightlifting {
  final String sport = "Weightlifting";
  DateTime date = DateTime.now();

  List<Exercise> list = [Exercise(name: "deadLift"),
    Exercise(name: "backSquat"),
    Exercise(name: "hipThrust"),
    Exercise(name: "legPress"),
    Exercise(name: "benchPress"),
    Exercise(name: "lateralPulldown"),
    Exercise(name: "bicepCurl"),
    Exercise(name: "tricepExtension") ];

  Weightlifting ();
}