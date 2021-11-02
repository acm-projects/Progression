import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/exercise.dart';
import 'package:temporary/models/weightlifting.dart';
import 'package:temporary/screens/home/weightlifting_log_list.dart';

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
  List<Weightlifting?> _WLlistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Weightlifting(
          sport: doc.get('sport') ?? '',
          date: doc.get('date') ?? DateTime.now(),
          listExercises: [
            Exercise(
              name: 'deadLift',
              weight: doc.get('deadLiftWeight') ?? 0,
              reps: doc.get('deadLiftReps') ?? 0
            ),
            Exercise(
                name: 'backSquat',
                weight: doc.get('backSquatWeight') ?? 0,
                reps: doc.get('backSquatReps') ?? 0
            ),
            Exercise(
                name: 'hipThrust',
                weight: doc.get('hipThrustWeight') ?? 0,
                reps: doc.get('hipThrustReps') ?? 0
            ),
            Exercise(
                name: 'legPress',
                weight: doc.get('legPressWeight') ?? 0,
                reps: doc.get('legPressReps') ?? 0
            ),
            Exercise(
                name: 'benchPress',
                weight: doc.get('benchPressWeight') ?? 0,
                reps: doc.get('benchPressReps') ?? 0
            ),
            Exercise(
                name: 'lateralPulldown',
                weight: doc.get('lateralPulldownWeight') ?? 0,
                reps: doc.get('lateralPulldownReps') ?? 0
            ),
            Exercise(
                name: 'bicepCurl',
                weight: doc.get('bicepCurlWeight') ?? 0,
                reps: doc.get('bicepCurlReps') ?? 0
            ),
            Exercise(
                name: 'tricepExtension',
                weight: doc.get('tricepExtensionWeight') ?? 0,
                reps: doc.get('tricepExtensionReps') ?? 0
            )
          ],

          /*deadLiftWeight: doc.get('deadLiftWeight') ?? 0,
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
        tricepExtensionReps: doc.get('tricepExtensionReps') ?? 0*/

      );

    }).toList();
  }

  Stream<List<Weightlifting?>> get WLlogs {
    return usersCollection.snapshots()
        .map(_WLlistFromSnapshot);
  }




}
