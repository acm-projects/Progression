import 'package:cloud_firestore/cloud_firestore.dart';

class Weightlifting {
  final String sport;
  final DateTime date;
  final int deadLiftWeight;
  final int deadLiftReps;
  final int backSquatWeight;
  final int backSquatReps;
  final int hipThrustWeight;
  final int hipThrustReps;
  final int legPressWeight;
  final int legPressReps;
  final int benchPressWeight;
  final int benchPressReps;
  final int lateralPulldownWeight;
  final int lateralPulldownReps;
  final int bicepCurlWeight;
  final int bicepCurlReps;
  final int tricepExtensionWeight;
  final int tricepExtensionReps;

  Weightlifting ({
    required this.sport,
    required this.date,
    required this.deadLiftWeight,
    required this.deadLiftReps,
    required this.backSquatWeight,
    required this.backSquatReps,
    required this.hipThrustWeight,
    required this.hipThrustReps,
    required this.legPressWeight,
    required this.legPressReps,
    required this.benchPressWeight,
    required this.benchPressReps,
    required this.lateralPulldownWeight,
    required this.lateralPulldownReps,
    required this.bicepCurlWeight,
    required this.bicepCurlReps,
    required this.tricepExtensionWeight,
    required this.tricepExtensionReps, });
}