import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/sport.dart';
import 'package:temporary/models/weightliftingLog.dart';
import 'package:temporary/screens/home/weightlifting_log_list.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String sport, int age) async {
    return await usersCollection.doc(uid).set({
      'sport': sport,
      'name': name,
      'age': age,
    });
  }

  //user list from snapshot
  List<Sport?> _sportListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Sport(
          name: doc.get('name') ?? '',
          sport: doc.get('sport') ?? '',
          age: doc.get('age') ?? 0
      );

    }).toList();
  }

  Stream<List<Sport?>> get users {
    return usersCollection.snapshots()
    .map(_sportListFromSnapshot);
  }

  //user list from snapshot
  List<WeightliftingLogs?> _WLlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return WeightliftingLogs(
          sport: doc.get('sport') ?? '',
          date: doc.get('date') ?? Timestamp.now(),
          deadLiftWeight: doc.get('deadLiftWeight') ?? 0,
        deadLiftReps: doc.get('deadLiftReps') ?? 0,
        backSquatWeight: doc.get('backSquatWeight') ?? 0,
        backSquatReps: doc.get('backSquatReps') ?? 0,
        hipThrustWeight: doc.get('hipThrustWeight') ?? 0,
        hipThrustReps: doc.get('hipThrustReps') ?? 0,
        legPressWeight: doc.get('legPressWeight') ?? 0,
        legPressReps: doc.get('legPressReps') ?? 0,
        benchPressWeight: doc.get('benchPressWeight') ?? 0,
        benchPressReps: doc.get('benchPressReps') ?? 0,
        lateralPulldownWeight: doc.get('lateralPulldownWeight') ?? 0,
        lateralPulldownReps: doc.get('lateralPulldownReps') ?? 0,
        bicepCurlWeight: doc.get('bicepCurlWeight') ?? 0,
        bicepCurlReps: doc.get('bicepCurlReps') ?? 0,
        tricepExtensionWeight: doc.get('tricepExtensionWeight') ?? 0,
        tricepExtensionReps: doc.get('tricepExtensionReps') ?? 0

      );

    }).toList();
  }

  Stream<List<WeightliftingLogs?>> get WLlogs {
    return usersCollection.snapshots()
        .map(_WLlistFromSnapshot);
  }

  //creates new weightlifting document
  Future newWeightliftingLog(String sport, Timestamp date, int deadLiftWeight, int deadLiftReps, int backSquatWeight, int backSquatReps, int hipThrustWeight, int hipThrustReps, int legPressWeight, int legPressReps, int benchPressWeight, int benchPressReps, int lateralPulldownWeight, int lateralPulldownReps, int bicepCurlWeight, int bicepCurlReps, int tricepExtensionWeight, int tricepExtensionReps) async {
    return await usersCollection.doc(uid).set({
      'sport': sport,
      'date': date,
      'deadLiftWeight': deadLiftWeight,
      'deadLiftReps': deadLiftReps,
      'backSquatWeight': backSquatWeight,
      'backSquatReps': backSquatReps,
      'hipThrustWeight': hipThrustWeight,
      'hipThrustReps': hipThrustReps,
      'legPressWeight': legPressWeight,
      'legPressReps': legPressReps,
      'benchPressWeight': benchPressWeight,
      'benchPressReps': benchPressReps,
      'lateralPulldownWeight': lateralPulldownWeight,
      'lateralPulldownReps': lateralPulldownReps,
      'bicepCurlWeight': bicepCurlWeight,
      'bicepCurlReps': bicepCurlReps,
      'tricepExtensionWeight': tricepExtensionWeight,
      'tricepExtensionReps': tricepExtensionReps,
    });
  }

  //creates new Swimming Document
  Future newSwimmingLog(Timestamp date, int splitTime, int setTime, int warmupDistance, int workoutDistance, int warmdownDistance, int repeats, String dryLands) async {
    return await usersCollection.doc(uid).collection('Swimming').doc().set({
      'date': date,
      'splitTime' :splitTime,
      'setTime': setTime,
      'warmupDistance': warmupDistance,
      'workoutDistance': workoutDistance,
      'warmdownDistance': warmdownDistance,
      'repeats': repeats,
      'dryLands': dryLands,
    });
  }

  //creates new Running Document
  Future newRunningLog(Timestamp date, int heartRate, String runType, int calories, String effortLevel, int runTime, int distance) async {
    return await usersCollection.doc(uid).collection('Running').doc().set({
      'date': date,
      'heartRate': heartRate,
      'runType': runType,
      'calories': calories,
      'effortLevel': effortLevel,
      'runTime': runTime,
      'distance': distance,
    });
  }

  /*Future getData() async {
    return await usersCollection.doc(uid).collection('Running').doc().get({
      'date': date,
      'heartRate': heartRate,
      'runType': runType,
      'calories': calories,
      'effortLevel': effortLevel,
      'runTime': runTime,
      'distance': distance,
    });
  }*/

  // sports list from snapshot
  /*List<Sport?> _sportListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Sport(
        name: doc.get('name') ?? '',
        sport: doc.get('sport') ?? '',
        age: doc.get('age') ?? 0
      );

    }).toList();
  }*/

  // get users stream
  /*Stream<QuerySnapshot> get weightliftingData {
    return usersCollection.collection('Weightlifting').doc().snapshots()
    .map(_sportListFromSnapshot);
  }*/

  //get user doc stream
}
