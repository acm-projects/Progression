import 'package:cloud_firestore/cloud_firestore.dart';

class Swimming {
  final String sport;
  final DateTime date;
  final int splitTime;
  final int setTime;
  final int warmupDistance;
  final int workoutDistance;
  final int warmdownDistance;
  final int repeats;
  final String drylands;

  Swimming ({
    required this.sport,
    required this.date,
    required this.splitTime,
    required this.setTime,
    required this.warmupDistance,
    required this.workoutDistance,
    required this.warmdownDistance,
    required this.repeats,
    required this.drylands,
  });
}