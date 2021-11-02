
import '../util/exercise.dart';

class Weightlifting {
  final String sport = "Weightlifting";
  DateTime date = DateTime.now();

  static List<Exercise> list = [
    Exercise(name: "deadLift"),
    Exercise(name: "backSquat"),
    Exercise(name: "hipThrust"),
    Exercise(name: "legPress"),
    Exercise(name: "benchPress"),
    Exercise(name: "lateralPulldown"),
    Exercise(name: "bicepCurl"),
    Exercise(name: "tricepExtension") ];

  List<Exercise> listExercises;


  Weightlifting ({sport, required this.date, required this.listExercises});
//Weightlifting.getWeightlifting ({sport, date, } );

}