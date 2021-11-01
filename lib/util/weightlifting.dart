import 'package:progression/util/exercise.dart';

class Weightlifting {
  final String sport = "Weightlifting";
  DateTime date = DateTime.now();

  List<Exercise> list = [
    Exercise(name: "Dead Lift"),
    Exercise(name: "Back Squat"),
    Exercise(name: "Hip Thrust"),
    Exercise(name: "Leg Press"),
    Exercise(name: "Bench Press"),
    Exercise(name: "Lateral Pulldown"),
    Exercise(name: "Bicep Curl"),
    Exercise(name: "Tricep Extension") ];

  Weightlifting ();
}