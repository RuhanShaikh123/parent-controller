import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/live_camera_datasource.dart';
import 'live_camera_repository.dart';

final liveCameraRepositoryProvider =
Provider<LiveCameraRepository>((ref) {
  return LiveCameraRepository(
    LiveCameraDatasource(),
  );
});