import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class PairingDatasource {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  Future<String> generatePairCode() async {

    final uid = auth.currentUser!.uid;

    final familyId = const Uuid().v4();

    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

    final random = Random();

    final code = List.generate(
      6,
          (_) => chars[random.nextInt(chars.length)],
    ).join();

    await firestore.collection("families").doc(familyId).set({
      "parentUid": uid,
      "createdAt": FieldValue.serverTimestamp(),
    });

    await firestore.collection("pairing_codes").doc(code).set({
      "familyId": familyId,
      "parentUid": uid,
      "childUid": null,
      "used": false,
      "expiresAt": Timestamp.fromDate(
        DateTime.now().add(
          const Duration(minutes: 10),
        ),
      ),
    });

    await firestore.collection("users").doc(uid).update({
      "familyId": familyId,
      "paired": false,
    });

    return code;
  }
}