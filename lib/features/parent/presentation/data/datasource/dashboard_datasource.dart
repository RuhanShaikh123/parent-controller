import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardDatasource {

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> getChild() async {

    final parentUid = auth.currentUser!.uid;

    final parentDoc = await firestore
        .collection("users")
        .doc(parentUid)
        .get();

    final parentData = parentDoc.data();

    if (parentData == null) {
      throw Exception("Parent not found");
    }

    if (parentData["paired"] != true) {
      throw Exception("No Child Connected");
    }

    final childUid = parentData["childUid"];

    final childDoc = await firestore
        .collection("users")
        .doc(childUid)
        .get();

    return childDoc.data()!;
  }
}