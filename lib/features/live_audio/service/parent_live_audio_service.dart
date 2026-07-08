import 'package:flutter/services.dart';

class ParentLiveAudioService {
  static const MethodChannel _channel =
  MethodChannel("parent_controller/live_audio");

  Future<void> startListening(String familyId) async {
    await _channel.invokeMethod("startListening", {
      "familyId": familyId,
    });
  }

  Future<void> stopListening() async {
    await _channel.invokeMethod("stopListening");
  }
}