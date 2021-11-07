import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/running.dart';
import 'package:temporary/models/swimming.dart';
import 'package:temporary/models/weightlifting.dart';
import 'package:temporary/models/weights.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');


  //user picks sport
  Future setUserSport(String sport, int age) async {
    return await usersCollection.doc(uid).set({
      'sport': sport
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


  //weights list
  //make one funtion for each excericse

  List<double> _DeadliftWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
       Weights(
        date: doc.get('date') ?? DateTime.now(),
        weight: doc.get('deadLiftWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double>  DLWeights() {
    List <double> weights = usersCollection.snapshots()
        .map(_DeadliftWeightsList) as List<double>;
    return weights;
  }

  List<double> _BackSquatWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
       Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('backSquatWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double>  BSWeights (){
  List <double> weights = usersCollection.snapshots()
        .map(_BackSquatWeightsList) as List<double>;
    return weights;
  }

  List<double> _HipThrustWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
     Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('hipThrustWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double>  HTWeights (){
  List <double> weights = usersCollection.snapshots()
        .map(_HipThrustWeightsList) as List<double>;
    return weights;
  }

  List<double> _LegPressWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
       Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('legPressWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

   List<double> LPWeights () {
    List <double> weights = usersCollection.snapshots()
        .map(_LegPressWeightsList) as List<double>;
    return weights;
  }


  List<double> _BenchPressWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
      Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('benchPressWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double> BPWeights () {
    List <double> weights = usersCollection.snapshots()
        .map(_BenchPressWeightsList) as List<double>;
    return weights;
  }

  List<double> _LateralPulldownWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
      Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('lateralPulldownWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double> LateralPDWeights () {
  List <double> weights = usersCollection.snapshots()
        .map(_LateralPulldownWeightsList) as List<double>;
    return weights;
  }

  List<double> _BicepCurlWeightsList(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
      Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('bicepCurlWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double> BCWeights() {
    List <double> weights =usersCollection.snapshots()
        .map(_BicepCurlWeightsList) as List<double>;
    return weights;
  }

  List<double> _TricepExtensionWeight(QuerySnapshot snapshot){
    List <Weights?> weights = snapshot.docs.map((doc){
      Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('tricepExtensionWeight') ?? 0);
    }).toList();
    final List<double> normalized = NormalizedData(weights);
    return normalized;
  }

  List<double> TEWeights() {
    List <double> weights = usersCollection.snapshots()
        .map(_TricepExtensionWeight) as List<double>;
    return weights;
  }


  List<double> NormalizedData (List<Weights?> weights) {
    final List<int> array = [];
    for(var i = 0 ; i < weights.length; i++) {
      array.add(weights[i]!.weight);
    }
    final lower = array.reduce(min);
    final upper = array.reduce(max);
    final List<double> normalized = [];

    for(var i = 0 ; i < array.length; i++){
      normalized.add((array[i] - lower) / (upper - lower));
    }
    return normalized;
  }


  List<double> ReturnList (String key){
    List<double> values = [];
    if(key == "Dead Lift"){
      values = DLWeights();
      return values;
    }
    else if (key == "Back Squat"){
      values = BSWeights();
      return values;
    }
    else if (key == "Hip Thrust") {
      values = HTWeights();
      return values;
    }
    else if (key == "Leg Press") {
      values = LPWeights();
      return values;
    }
    else if (key == "Bench Press") {
      values = BPWeights();
      return values;
    }
    else if (key == "Lateral Pulldown ") {
      values = LateralPDWeights();
      return values;
    }
    else if (key == "Bicep Curl") {
      values = BCWeights();
      return values;
    }
    else if (key == "Tricep Extension") {
      values = TEWeights();
      return values;
    }

  }

  //gets the log based on a given date --> to be used with calendar
  Stream<List<Weightlifting?>> CalendarLog (int day, int month, int year) {
    return FirebaseFirestore.instance.collectionGroup('Weightlifting').where('date', isEqualTo: DateTime.utc(year, month, day)).snapshots()
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