
import '../util/exercise.dart';

class Weightlifting {
  final String sport = "Weightlifting";
  DateTime date = DateTime.now();

  static List<Exercise> list = [
    Exercise(name: "Dead Lift"),
    Exercise(name: "Back Squat"),
    Exercise(name: "Hip Thrust"),
    Exercise(name: "Leg Press"),
    Exercise(name: "Bench Press"),
    Exercise(name: "Lateral Pulldown"),
    Exercise(name: "Bicep Curl"),
    Exercise(name: "Tricep Extension") ];

  static List<String> listNames = [
    "Dead Lift",
    "Back Squat",
    "Hip Thrust",
    "Leg Press",
    "Bench Press",
    "Lateral Pulldown",
    "Bicep Curl",
    "Tricep Extension"
  ];

  List<Exercise> listExercises;


  Weightlifting ({sport, required this.date, required this.listExercises});
//Weightlifting.getWeightlifting ({sport, date, } );

}