import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LocationDatasource {

  final firestore = FirebaseFirestore.instance;

  final auth = FirebaseAuth.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> childLocation() async* {

    final parentUid = auth.currentUser!.uid;

    final parentDoc =
    await firestore.collection("users").doc(parentUid).get();

    final childUid = parentDoc["childUid"];

    yield* firestore
        .collection("users")
        .doc(childUid)
        .snapshots();
  }
}