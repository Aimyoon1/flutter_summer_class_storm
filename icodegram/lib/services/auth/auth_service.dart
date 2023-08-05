// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // instance Auth => U can use all of functions of Authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //  instance of Firestore
  // final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // sign in method by FIREBASE AUTH
  Future<UserCredential> signIn(email, password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  // sign up method by FIREBASE AUTH
  Future<UserCredential> signUp(email, password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
