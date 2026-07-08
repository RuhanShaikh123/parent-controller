import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../ models/user_model.dart';

class AuthDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;

    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "uid": uid,
      "role": "child",
      "familyId": null,
      "paired": false,
      "createdAt": Timestamp.now(),
    });

    await userCredential.user!.updateDisplayName(
      "$firstName $lastName",
    );


  }

  Future<UserModel> getCurrentUser() async {
    final uid = _auth.currentUser!.uid;

    final doc = await _firestore
        .collection("users")
        .doc(uid)
        .get();

    return UserModel.fromJson(doc.data()!);
  }

  Future<void>saveRole(String role)async{

    final uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({

      "role":role,

    });

  }
}