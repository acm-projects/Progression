import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/Weights.dart';
import 'package:temporary/models/exercise.dart';
import 'package:temporary/models/weightlifting.dart';
import 'dart:math';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  //creates new weightlifting document
  Future newWeightliftingLog(String sport, Timestamp date, List<Exercise> workouts) async {
    return await usersCollection.doc(uid).set({
      'sport': sport,
      'date': date,
      'deadLiftWeight': workouts[0].getWeight(),
      'deadLiftReps': workouts[0].getReps(),
      'deadLiftSets': workouts[0].getSets(),
      'backSquatWeight': workouts[1].getWeight(),
      'backSquatReps': workouts[1].getReps(),
      'backSquatSets': workouts[1].getSets(),
      'hipThrustWeight': workouts[2].getWeight(),
      'hipThrustReps': workouts[2].getReps(),
      'hipThrustSets': workouts[2].getSets(),
      'legPressWeight': workouts[3].getWeight(),
      'legPressReps': workouts[3].getReps(),
      'legPressSets': workouts[3].getSets(),
      'benchPressWeight': workouts[4].getWeight(),
      'benchPressReps': workouts[4].getReps(),
      'benchPressSets': workouts[4].getSets(),
      'lateralPulldownWeight': workouts[5].getWeight(),
      'lateralPulldownReps': workouts[5].getReps(),
      'lateralPulldownSets': workouts[5].getSets(),
      'bicepCurlWeight': workouts[6].getWeight(),
      'bicepCurlReps': workouts[6].getReps(),
      'bicepCurlSets': workouts[6].getSets(),
      'tricepExtensionWeight': workouts[7].getWeight(),
      'tricepExtensionReps': workouts[7].getReps(),
      'tricepExtensionSets': workouts[7].getSets(),
    });
  }

  //user list from snapshot
  List<Weightlifting?> _WLlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weightlifting(
          sport: doc.get('sport') ?? '',
          date: doc.get('date') ?? DateTime.now(),
          listExercises: [
            Exercise(
              name: 'deadLift',
              weight: doc.get('deadLiftWeight') ?? 0,
              reps: doc.get('deadLiftReps') ?? 0,
              sets: doc.get('deadLiftSets') ?? 0
            ),
            Exercise(
                name: 'backSquat',
                weight: doc.get('backSquatWeight') ?? 0,
                reps: doc.get('backSquatReps') ?? 0,
                sets: doc.get('backSquatSets') ?? 0
            ),
            Exercise(
                name: 'hipThrust',
                weight: doc.get('hipThrustWeight') ?? 0,
                reps: doc.get('hipThrustReps') ?? 0,
                sets: doc.get('hipThrustSets') ?? 0
            ),
            Exercise(
                name: 'legPress',
                weight: doc.get('legPressWeight') ?? 0,
                reps: doc.get('legPressReps') ?? 0,
                sets: doc.get('legPressSets') ?? 0
            ),
            Exercise(
                name: 'benchPress',
                weight: doc.get('benchPressWeight') ?? 0,
                reps: doc.get('benchPressReps') ?? 0,
                sets: doc.get('benchPressSets') ?? 0
            ),
            Exercise(
                name: 'lateralPulldown',
                weight: doc.get('lateralPulldownWeight') ?? 0,
                reps: doc.get('lateralPulldownReps') ?? 0,
                sets: doc.get('lateralPulldownSets') ?? 0
            ),
            Exercise(
                name: 'bicepCurl',
                weight: doc.get('bicepCurlWeight') ?? 0,
                reps: doc.get('bicepCurlReps') ?? 0,
                sets: doc.get('bicepCurlSets') ?? 0
            ),
            Exercise(
                name: 'tricepExtension',
                weight: doc.get('tricepExtensionWeight') ?? 0,
                reps: doc.get('tricepExtensionReps') ?? 0,
                sets: doc.get('tricepExtensionSets') ?? 0
            )
          ],
      );

    }).toList();
  }

  Stream<List<Weightlifting?>> get WLlogs {
    return usersCollection.snapshots()
        .map(_WLlistFromSnapshot);
  }

  List<Weights?> _DeadliftWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('deadLiftWeight') ?? 0);
    }).toList();
  }

  List<Weights?> _BackSquatWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('backSquatWeight') ?? 0);
    }).toList();
  }

  List<Weights?> _HipThrustWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('hipThrustWeight') ?? 0);
    }).toList();
  }

  List<Weights?> _LegPressWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('legPressWeight') ?? 0);
    }).toList();
  }


  List<Weights?> _BenchPressWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('benchPressWeight') ?? 0);
    }).toList();
  }

  List<Weights?> _LateralPulldownWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('lateralPulldownWeight') ?? 0);
    }).toList();
  }

  List<Weights?> _BicepCurlWeightsList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('bicepCurlWeight') ?? 0);
    }).toList();
  }

  List<Weights?> _TricepExtensionWeight(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weights(
          date: doc.get('date') ?? DateTime.now(),
          weight: doc.get('tricepExtensionWeight') ?? 0);
    }).toList();
  }

  List<double> NormalizedData (List<Weights?> weights) {
    final List<int> array = [];
    for(var i = 0 ; i < weights.length; i++) {
      array[i] = weights[i]!.weight;
    }
    final lower = array.reduce(min);
    final upper = array.reduce(max);
    final List<double> normalized = [];

    array.forEach((element) => element < 0
        ? normalized.add(-(element / lower))
        : normalized.add(element / upper));
    return normalized;
  }

  Stream<List<Weights?>> get DLWeights {
    return usersCollection.snapshots()
        .map(_DeadliftWeightsList);
  }

  Stream<List<Weights?>> get BSWeights {
    return usersCollection.snapshots()
        .map(_BackSquatWeightsList);
  }
  Stream<List<Weights?>> get HTWeights {
    return usersCollection.snapshots()
        .map(_HipThrustWeightsList);
  }
  Stream<List<Weights?>> get LegPWeights {
    return usersCollection.snapshots()
        .map(_LegPressWeightsList);
  }
  Stream<List<Weights?>> get BPWeights {
    return usersCollection.snapshots()
        .map(_BenchPressWeightsList);
  }
  Stream<List<Weights?>> get LatPWeights {
    return usersCollection.snapshots()
        .map(_LateralPulldownWeightsList);
  }
  Stream<List<Weights?>> get BCWeights {
    return usersCollection.snapshots()
        .map(_BicepCurlWeightsList);
  }
  Stream<List<Weights?>> get TEWeights {
    return usersCollection.snapshots()
        .map(_TricepExtensionWeight);
  }

  //gets the log based on a given date --> to be used with calendar
  Stream<List<Weightlifting?>> CalendarLog (int day, int month, int year) {
    return FirebaseFirestore.instance.collectionGroup('Weightlifting').where('date', isEqualTo: DateTime.utc(year, month, day)).snapshots()
        .map(_WLlistFromSnapshot);
  }




}
