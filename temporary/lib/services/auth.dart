import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temporary/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:temporary/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object based on FirebaseUser
  Users? _userFromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    }
    return Users(uid: user.uid);
  }

  //auth change user stream
  //FirebaseUser is User now
  Stream<Users?> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //sign in with email and password
  @override
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  @override
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('New Progression Member', 'Undecided Sport', 100);
      await DatabaseService(uid: user!.uid).newWeightliftingLog("weightlifting", Timestamp.now(), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}