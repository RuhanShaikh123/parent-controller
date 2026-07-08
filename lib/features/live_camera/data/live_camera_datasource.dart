import 'package:cloud_firestore/cloud_firestore.dart';

class LiveCameraDatasource {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  Future<void> startCamera(String familyId) async {
    await firestore.collection("families").doc(familyId).set({
      "commands": {
        "camera": true,
      }
    }, SetOptions(merge: true));
  }

  Future<void> stopCamera(String familyId) async {
    await firestore.collection("families").doc(familyId).set({
      "commands": {
        "camera": false,
      }
    }, SetOptions(merge: true));
  }
}