import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../repository/live_audio_repository_provider.dart';

class LiveAudioNotifier extends StateNotifier<bool> {
  LiveAudioNotifier(this.ref) : super(false);

  final Ref ref;

  Future<void> start(String familyId) async {
    await ref
        .read(liveAudioRepositoryProvider)
        .startListening(familyId);

    state = true;
  }

  Future<void> stop(String familyId) async {
    await ref
        .read(liveAudioRepositoryProvider)
        .stopListening(familyId);

    state = false;
  }
}

final liveAudioProvider =
StateNotifierProvider<LiveAudioNotifier, bool>((ref) {
  return LiveAudioNotifier(ref);
});