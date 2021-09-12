import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String name, email, profileimg;
bool existence;
Future<void> addGoogleUser(
    String uid, String name, String email, String profileimg) async {
  return await FirebaseFirestore.instance.collection("users").doc(uid).set({
    'username': name,
    'email': email,
    'profileimg': profileimg,
  });
}

Future<void> fetchData() async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      name = value.get('username');
      email = value.get('email');
      profileimg = value.get('profileimg');
      existence = value.exists;
    });
  } catch (e) {}
}

Future<void> updateNotification(String id) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("notifications")
      .doc(id)
      .update({
    'existence': false,
  });
}