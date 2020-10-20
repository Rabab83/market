import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});
  final String uid;
}
 
 // AuthBase class 
abstract class AuthBase {
  Stream<User> get onAuthStateChanged; //onAuthStateChanged prototype
  Future<User> signInWithEmailAndPassword(
    String email,
    String password,
       );                            //signInWithEmailAndPassword prototype
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
    
    );                            //createUserWithEmailAndPassword prototype
  Future<void> signOut();         //signOut prototype
}

 // Auth Class
class Auth implements AuthBase {

  final _firebaseAuth = FirebaseAuth.instance;
     //function to return user id
    User _userFromFirebase(user) {
      if (user == null) { 
       return null;
      }
       return User(uid: user.uid);
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  
  @override
  Future<User> signInWithEmailAndPassword(
    String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password, ) async {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(authResult.user.email)
        .set({
       'email': email,
      'password': password,
    }); //only after siging up
        return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
