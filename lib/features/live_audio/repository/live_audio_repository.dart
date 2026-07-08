import '../data/live_audio_datasource.dart';

class LiveAudioRepository {
  final LiveAudioDatasource datasource;

  LiveAudioRepository(this.datasource);

  Future<void> startListening(String familyId) {
    return datasource.startListening(familyId);
  }

  Future<void> stopListening(String familyId) {
    return datasource.stopListening(familyId);
  }
}