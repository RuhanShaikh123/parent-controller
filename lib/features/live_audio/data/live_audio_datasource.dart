import 'package:cloud_firestore/cloud_firestore.dart';

import '../service/parent_live_audio_service.dart';

class LiveAudioDatasource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ParentLiveAudioService audioService = ParentLiveAudioService();

  Future<void> startListening(String familyId) async {
    await firestore.collection("families").doc(familyId).set({
      "commands": {
        "microphone": true,
      }
    }, SetOptions(merge: true));

    await audioService.startListening(familyId);
  }

  Future<void> stopListening(String familyId) async {
    await firestore.collection("families").doc(familyId).set({
      "commands": {
        "microphone": false,
      }
    }, SetOptions(merge: true));

    await audioService.stopListening();
  }
}