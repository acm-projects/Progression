import 'package:cloud_firestore/cloud_firestore.dart';

class Running {
  final String sport;
  final DateTime date;
  final int heartrate;
  final String runType;
  final int calories;
  final String effortLevel;
  final int time;
  final int distance;

  Running ({
    required this.sport,
    required this.date,
    required this.heartrate,
    required this.runType,
    required this.calories,
    required this.effortLevel,
    required this.time,
    required this.distance, });
}