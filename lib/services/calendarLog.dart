import "package:cloud_firestore/cloud_firestore.dart";

class CalendarLog {

  getCalendarLog(String sportName, Timestamp date) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('sport', isEqualTo: sportName)
        .get();
  }
}