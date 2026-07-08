import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/live_camera_provider.dart';

class LiveCameraScreen extends ConsumerWidget {
  final String familyId;

  const LiveCameraScreen({
    super.key,
    required this.familyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(liveCameraProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Camera"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: Icon(
            active
                ? Icons.stop
                : Icons.videocam,
          ),
          label: Text(
            active
                ? "Stop Camera"
                : "Start Camera",
          ),
          onPressed: () async {
            if (active) {
              await ref
                  .read(liveCameraProvider.notifier)
                  .stop(familyId);
            } else {
              await ref
                  .read(liveCameraProvider.notifier)
                  .start(familyId);
            }
          },
        ),
      ),
    );
  }
}