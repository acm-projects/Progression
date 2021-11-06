
import 'package:progression/util/selected_exercise.dart';
import './weightlifting.dart';

class Users {

  final String uid;
  List<List<SelectedExercise>> exercises = [
    [
      SelectedExercise(name: Weightlifting.listNames[0]),
      SelectedExercise(name: Weightlifting.listNames[1]),
      SelectedExercise(name: Weightlifting.listNames[2]),
      SelectedExercise(name: Weightlifting.listNames[3]),
      SelectedExercise(name: Weightlifting.listNames[4]),
      SelectedExercise(name: Weightlifting.listNames[5]),
      SelectedExercise(name: Weightlifting.listNames[6]),
      SelectedExercise(name: Weightlifting.listNames[7]),
    ],
  ];

  Users({required this.uid});


}
