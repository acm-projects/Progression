import 'package:cloud_firestore/cloud_firestore.dart';

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

}
