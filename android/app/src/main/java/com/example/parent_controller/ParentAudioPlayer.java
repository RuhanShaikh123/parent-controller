package com.example.parent_controller;
import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTrack;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import okio.ByteString;

public class ParentAudioPlayer {

    private static final String TAG = "ParentAudioPlayer";
    private static final String SERVER =
            "wss://parental-control-server-bckk.onrender.com";

    private String lastFamilyId;
    private WebSocket webSocket;
    private AudioTrack audioTrack;
    private boolean manuallyStopped = false;

    public void start(String familyId) {
        lastFamilyId = familyId;
        manuallyStopped = false;

        startAudioTrack();

        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url(SERVER + "?role=parent&familyId=" + familyId)
                .build();

        webSocket = client.newWebSocket(
                request,
                new WebSocketListener() {

                    @Override
                    public void onOpen(WebSocket webSocket, Response response) {
                        Log.d(TAG, "Parent connected");
                    }

                    @Override
                    public void onMessage(WebSocket webSocket, ByteString bytes) {
                        byte[] audio = bytes.toByteArray();

                        Log.d(TAG, "Audio received bytes = " + audio.length);

                        if (audioTrack != null) {
                            audioTrack.write(audio, 0, audio.length);
                        }
                    }

                    @Override
                    public void onFailure(WebSocket webSocket, Throwable t, Response response) {
                        Log.e(TAG, "WebSocket error", t);

                        if (!manuallyStopped && lastFamilyId != null) {
                            new Handler(Looper.getMainLooper())
                                    .postDelayed(() -> start(lastFamilyId), 3000);
                        }
                    }
                }
        );
    }

    private void startAudioTrack() {
        int sampleRate = 16000;

        int bufferSize = AudioTrack.getMinBufferSize(
                sampleRate,
                AudioFormat.CHANNEL_OUT_MONO,
                AudioFormat.ENCODING_PCM_16BIT
        );

        audioTrack = new AudioTrack.Builder()
                .setAudioAttributes(
                        new AudioAttributes.Builder()
                                .setUsage(AudioAttributes.USAGE_MEDIA)
                                .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                                .build()
                )
                .setAudioFormat(
                        new AudioFormat.Builder()
                                .setSampleRate(sampleRate)
                                .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                                .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                                .build()
                )
                .setBufferSizeInBytes(bufferSize)
                .setTransferMode(AudioTrack.MODE_STREAM)
                .build();

        audioTrack.play();
    }

    public void stop() {
        manuallyStopped = true;

        if (webSocket != null) {
            webSocket.close(1000, "stop");
            webSocket = null;
        }

        if (audioTrack != null) {
            audioTrack.stop();
            audioTrack.release();
            audioTrack = null;
        }
    }
}