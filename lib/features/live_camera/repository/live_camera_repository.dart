import '../data/live_camera_datasource.dart';

class LiveCameraRepository {
  final LiveCameraDatasource datasource;

  LiveCameraRepository(this.datasource);

  Future<void> startCamera(String familyId) {
    return datasource.startCamera(familyId);
  }

  Future<void> stopCamera(String familyId) {
    return datasource.stopCamera(familyId);
  }
}