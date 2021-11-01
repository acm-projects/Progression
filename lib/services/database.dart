import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/running.dart';
import 'package:temporary/models/swimming.dart';
import 'package:temporary/models/weightlifting.dart';

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


  //creates new weightlifting document
  Future newWeightliftingLog(String sport, DateTime date, int deadLiftWeight, int deadLiftReps, int backSquatWeight, int backSquatReps, int hipThrustWeight, int hipThrustReps, int legPressWeight, int legPressReps, int benchPressWeight, int benchPressReps, int lateralPulldownWeight, int lateralPulldownReps, int bicepCurlWeight, int bicepCurlReps, int tricepExtensionWeight, int tricepExtensionReps) async {
    return await usersCollection.doc(uid).collection("Weightlifting").doc().set({
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

  //user list from snapshot
  List<Weightlifting?> _WLlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weightlifting(
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

  Stream<List<Weightlifting?>> get WLlogs {
    return FirebaseFirestore.instance.collectionGroup('Weightlifting').where('deadLiftWeight', isEqualTo: 2021).snapshots()
        .map(_WLlistFromSnapshot);
  }


  //creates new running document
  Future newRunningLog(String sport, DateTime date, int heartrate, String runType, int calories, String effortLevel, int time, int distance) async {
    return await usersCollection.doc(uid).collection("Running").doc().set({
      'sport': sport,
      'date': date,
      'heartrate': heartrate,
      'runType': runType,
      'calories': calories,
      'effortLevel': effortLevel,
      'time': time,
      'distance': distance,
    });
  }

  //user list from snapshot
  List<Running?> _RlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Running(
          sport: doc.get('sport') ?? '',
          date: doc.get('date') ?? Timestamp.now(),
          heartrate: doc.get('heartrate') ?? 0,
          runType: doc.get('runType') ?? '',
          calories: doc.get('calories') ?? 0,
          effortLevel: doc.get('effortLevel') ?? '',
          time: doc.get('time') ?? 0,
          distance: doc.get('distance') ?? 0

      );

    }).toList();
  }

  Stream<List<Running?>> get RLogs {
    return usersCollection.snapshots()
        .map(_RlistFromSnapshot);
  }


  //creates new swimming document
  Future newSwimmingLog(String sport, DateTime date, int splitTime, int setTime, int warmupDistance, int workoutDistance, int warmpdownDistance, int repeats, String drylands) async {
    return await usersCollection.doc(uid).collection("Swimming").doc().set({
      'sport': sport,
      'date': date,
      'splitTime': splitTime,
      'setTime': setTime,
      'warmupDistance': warmupDistance,
      'workoutDistance': workoutDistance,
      'warmpdownDistance': warmpdownDistance,
      'repeats': repeats,
      'drylands': drylands,

    });
  }

  //user list from snapshot
  List<Swimming?> _SlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Swimming(
          sport: doc.get('sport') ?? '',
          date: doc.get('date') ?? Timestamp.now(),
          splitTime: doc.get('splitTime') ?? 0,
          setTime: doc.get('setTime') ?? 0,
          warmupDistance: doc.get('warmupDistance') ?? 0,
          workoutDistance: doc.get('workoutDistance') ?? 0,
          warmdownDistance: doc.get('warmdownDistance') ?? 0,
          repeats: doc.get('repeats') ?? 0,
          drylands: doc.get('drylands') ?? ''

      );

    }).toList();
  }

  Stream<List<Swimming?>> get SLogs {
    return usersCollection.snapshots()
        .map(_SlistFromSnapshot);
  }




}