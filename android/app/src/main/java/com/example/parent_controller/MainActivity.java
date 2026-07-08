package com.example.parent_controller;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "parent_controller/live_audio";

    private ParentAudioPlayer parentAudioPlayer;

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {

        super.configureFlutterEngine(flutterEngine);

        parentAudioPlayer = new ParentAudioPlayer();

        new MethodChannel(
                flutterEngine.getDartExecutor().getBinaryMessenger(),
                CHANNEL
        ).setMethodCallHandler((call, result) -> {

            if (call.method.equals("startListening")) {

                String familyId = call.argument("familyId");

                parentAudioPlayer.start(familyId);

                result.success(true);

            } else if (call.method.equals("stopListening")) {

                parentAudioPlayer.stop();

                result.success(true);

            } else {
                result.notImplemented();
            }
        });
    }
}