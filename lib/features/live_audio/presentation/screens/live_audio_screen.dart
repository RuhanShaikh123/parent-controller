import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/live_audio_provider.dart';

class LiveAudioScreen extends ConsumerWidget {
  final String familyId;

  const LiveAudioScreen({
    super.key,
    required this.familyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listening = ref.watch(liveAudioProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Audio"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(
            listening ? Icons.stop : Icons.mic,
          ),
          label: Text(
            listening ? "Stop Listening" : "Start Listening",
          ),
          onPressed: () async {
            if (listening) {
              await ref
                  .read(liveAudioProvider.notifier)
                  .stop(familyId);
            } else {
              await ref
                  .read(liveAudioProvider.notifier)
                  .start(familyId);
            }
          },
        ),
      ),
    );
  }
}