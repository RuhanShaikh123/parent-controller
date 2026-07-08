import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../repository/live_camera_repository_provider.dart';

class LiveCameraNotifier extends StateNotifier<bool> {
  LiveCameraNotifier(this.ref) : super(false);

  final Ref ref;

  Future<void> start(String familyId) async {
    await ref
        .read(liveCameraRepositoryProvider)
        .startCamera(familyId);

    state = true;
  }

  Future<void> stop(String familyId) async {
    await ref
        .read(liveCameraRepositoryProvider)
        .stopCamera(familyId);

    state = false;
  }
}

final liveCameraProvider =
StateNotifierProvider<LiveCameraNotifier, bool>((ref) {
  return LiveCameraNotifier(ref);
});