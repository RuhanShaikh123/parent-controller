import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/live_audio_datasource.dart';
import 'live_audio_repository.dart';

final liveAudioRepositoryProvider =
Provider<LiveAudioRepository>((ref) {
  return LiveAudioRepository(
    LiveAudioDatasource(),
  );
});