import '../user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object based on FirebaseUser
  Users? _userFromFirebaseUser(User? user) {
    if (user == null) {
      return null;
    }
    return Users(rememberMe: false, uid: user.uid);
  }

  //auth change user stream
  //FirebaseUser is User now
  Stream<Users?> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  //sign in with email and password
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
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('New Progression Member', 'Undecided Sport', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}