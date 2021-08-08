import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as JSON;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:plantdiseasedetector/services/dbdata.dart';

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String imageUrl;
  String userName;
  bool isExists = false;

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      // Checking if email and name is null
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      imageUrl = user.photoURL;
      userName = user.displayName;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      await checkIfUserExist(user.email).then((value) {
        if (isExists == false) {
          addGoogleUser(user.uid, user.displayName, user.email, user.photoURL);
        }
      });

      print('signInWithGoogle succeeded: $user');

      return '${user.uid}';
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }

  Future<void> checkIfUserExist(String email) async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((querySnapShot) {
      if (querySnapShot.size >= 1) {
        querySnapShot.docs.forEach((element) {
          isExists = true;
          print(isExists);
        });
      } else {
        isExists = false;
      }
    });
  }
}
