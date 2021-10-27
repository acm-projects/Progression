import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/weightlifting.dart';
import 'package:temporary/screens/home/weightlifting_log_list.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

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
    return usersCollection.snapshots()
        .map(_WLlistFromSnapshot);
  }




}
