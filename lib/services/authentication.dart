// ignore_for_file: non_constant_identifier_names

import 'package:enimilo/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(
      String UserName, String Email, String Password, context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: Email, password: Password);
      if (userCredential.user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: userCredential.user!.uid)
            .savingUserData(UserName, Email);
        return true;
      }
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(25),
      ));
    }
  }

  Future login(String Email, String Password, context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: Email, password: Password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.green,
      ));
    }
  }

  Future resetPassword(String Email, context) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: Email);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }

  Future logout(context) async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }

  Future googleSignIn(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credentials = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credentials);
        return userCredential;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }
}
