import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progression/util/package_utils/globals.dart';
import '../exercise.dart';
import '../weightlifting.dart';
import '../selected_exercise.dart';
import 'dart:math';

class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('users');

  // Creates a store of selected Exercises
  Future selectedExerciseLog(List<List<SelectedExercise>> list) async {
    return await usersCollection.doc(uid).set(
      {
        'Dead Lift': list[0][0].selected,
        'Back Squat': list[0][1].selected,
        'Hip Thrust': list[0][2].selected,
        'Leg Press': list[0][3].selected,
        'Bench Press': list[0][4].selected,
        'Lateral Pulldown': list[0][5].selected,
        'Bicep Curl': list[0][6].selected,
        'Tricep Extension': list[0][7].selected,

      });
  }

  void setExercises (DocumentSnapshot getDocumentSnapshotForExercise) async {
      currentUserSelf.exercises[0][0].selected = await getExerciseValue(keyValue: "Dead Lift");
      currentUserSelf.exercises[0][1].selected = await getExerciseValue(keyValue: "Back Squat");
      currentUserSelf.exercises[0][2].selected = await getExerciseValue(keyValue: "Hip Thrust");
      currentUserSelf.exercises[0][3].selected = await getExerciseValue(keyValue: "Leg Press");
      currentUserSelf.exercises[0][4].selected = await getExerciseValue(keyValue: "Bench Press");
      currentUserSelf.exercises[0][5].selected = await getExerciseValue(keyValue: "Lateral Pulldown");
      currentUserSelf.exercises[0][6].selected = await getExerciseValue(keyValue: "Bicep Curl");
      currentUserSelf.exercises[0][7].selected = await getExerciseValue(keyValue: "Tricep Extension");
  }


  Future<DocumentSnapshot> getDocumentSnapshotForExercise() async
  {
    return await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  Future<bool> getExerciseValue({required String keyValue}) async {
    DocumentSnapshot documentSnapshot = await getDocumentSnapshotForExercise();
    return (documentSnapshot.data() as Map<String, dynamic>)[keyValue];
  }
  

  //creates new weightlifting document
  Future newWeightliftingLog(String sport, DateTime date,
      List<Exercise> workouts) async {
    return await usersCollection.doc(uid).collection("Weightlifting").doc().set(
        {
          'sport': sport,
          'date': date,
          'deadLiftWeight': workouts[0].getWeight(),
          'deadLiftReps': workouts[0].getReps(),
          'backSquatWeight': workouts[1].getWeight(),
          'backSquatReps': workouts[1].getReps(),
          'hipThrustWeight': workouts[2].getWeight(),
          'hipThrustReps': workouts[2].getReps(),
          'legPressWeight': workouts[3].getWeight(),
          'legPressReps': workouts[3].getReps(),
          'benchPressWeight': workouts[4].getWeight(),
          'benchPressReps': workouts[4].getReps(),
          'lateralPulldownWeight': workouts[5].getWeight(),
          'lateralPulldownReps': workouts[5].getReps(),
          'bicepCurlWeight': workouts[6].getWeight(),
          'bicepCurlReps': workouts[6].getReps(),
          'tricepExtensionWeight': workouts[7].getWeight(),
          'tricepExtensionReps': workouts[7].getReps(),
        });
  }

  //user list from snapshot
  List<Weightlifting?> _wLlistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Weightlifting(
        sport: doc.get('sport') ?? '',
        date: doc.get('date') ?? DateTime.now(),
        listExercises: [
          Exercise(
              name: 'Dead Lift',
              weight: doc.get('deadLiftWeight') ?? 0,
              reps: doc.get('deadLiftReps') ?? 0
          ),
          Exercise(
              name: 'Back Squat',
              weight: doc.get('backSquatWeight') ?? 0,
              reps: doc.get('backSquatReps') ?? 0
          ),
          Exercise(
              name: 'Hip Thrust',
              weight: doc.get('hipThrustWeight') ?? 0,
              reps: doc.get('hipThrustReps') ?? 0
          ),
          Exercise(
              name: 'Leg Press',
              weight: doc.get('legPressWeight') ?? 0,
              reps: doc.get('legPressReps') ?? 0
          ),
          Exercise(
              name: 'Bench Press',
              weight: doc.get('benchPressWeight') ?? 0,
              reps: doc.get('benchPressReps') ?? 0
          ),
          Exercise(
              name: 'Lateral Pulldown',
              weight: doc.get('lateralPulldownWeight') ?? 0,
              reps: doc.get('lateralPulldownReps') ?? 0
          ),
          Exercise(
              name: 'Bicep Curl',
              weight: doc.get('bicepCurlWeight') ?? 0,
              reps: doc.get('bicepCurlReps') ?? 0
          ),
          Exercise(
              name: 'Tricep Extension',
              weight: doc.get('tricepExtensionWeight') ?? 0,
              reps: doc.get('tricepExtensionReps') ?? 0
          )
        ],

      );
    }).toList();
  }

  Stream<List<Weightlifting?>> get wLlogs {
    return FirebaseFirestore.instance.collectionGroup('Weightlifting')
        .snapshots()
        .map(_wLlistFromSnapshot);
  }


  //gets the log based on a given date --> to be used with calendar
  List<Weightlifting?> calendarLog () {
    List <Weightlifting?> weights;
    weights =  FirebaseFirestore.instance.collectionGroup('Weightlifting').snapshots()
        .map(_wLlistFromSnapshot) as List<Weightlifting?>;
    return weights;
  }

  Future<List<double>> weights (String key) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").doc(uid).collection("Weightlifting").where(key, isNotEqualTo: 0).get();
    var list = querySnapshot.docs;
    print('This is the snapshot: ${querySnapshot.docs}');
    List<int> list1 = [];
    for (var element in list) {
      list1.add(element.get('deadLiftWeight'));
    }
    print('This is the list: $list1');
    final List<double> normalized = NormalizedData(list1);
    return normalized;
  }

  List<double> NormalizedData (List<int?> weights) {
    final List<double> array = [];
    for(var i = 0 ; i < weights.length; i++) {
      array.add(weights[i]!.toDouble());
    }
    const lower = 0;
    final upper = array.reduce(max);
    final List<double> normalized = [];

    for(var i = 0 ; i < array.length; i++){
      normalized.add((array[i] - lower) / (upper - lower));
    }
    return normalized;
  }



  Future<List<double>> returnList (String key) async {
    if(key == "Dead Lift"){
      return await weights("deadLiftWeight");
    }
    else if (key == "Back Squat"){
      return await weights("backSquatWeight");
    }
    else if (key == "Hip Thrust") {
      return await weights("hipThrustWeight");
    }
    else if (key == "Leg Press") {
      return await weights("legPressWeight");
    }
    else if (key == "Bench Press") {
      return await weights("benchPressWeight");
    }
    else if (key == "Lateral Pulldown") {
      return await weights("lateralPulldownWeight");
    }
    else if (key == "Bicep Curl") {
      return await weights("bicepCurlWeight");
    }
    else if (key == "Tricep Extension") {
      return await weights("tricepExtensionWeight");
    }
    return [];
  }

  //gets the log based on a given date --> to be used with calendar
  Stream<List<Weightlifting?>> CalendarLog (int day, int month, int year) {
    return FirebaseFirestore.instance.collectionGroup('Weightlifting').where(
        'date', isEqualTo: DateTime.utc(year, month, day)).snapshots()
        .map(_wLlistFromSnapshot);
  }

}