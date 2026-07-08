import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../providers/pairing_provider.dart';

class ParentPairScreen extends ConsumerWidget {
  const ParentPairScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pairing = ref.watch(pairingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Connect Child"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: pairing.when(
            data: (code) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.family_restroom,
                    size: 80,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Connect your child's device",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  if (code != null)
                    QrImageView(
                      data: code,
                      size: 220,
                    ),

                  const SizedBox(height: 20),

                  if (code != null)
                    SelectableText(
                      code,
                      style: const TextStyle(
                        fontSize: 30,
                        letterSpacing: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  const SizedBox(height: 20),

                  if (code != null)
                    ElevatedButton.icon(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: code),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text("Code copied"),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy),
                      label: const Text("Copy Code"),
                    ),

                  const SizedBox(height: 30),

                  FilledButton(
                    onPressed: () {
                      ref
                          .read(pairingProvider.notifier)
                          .generateCode();
                    },
                    child: Text(
                      code == null
                          ? "Generate Pair Code"
                          : "Generate New Code",
                    ),
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text(e.toString()),
          ),
        ),
      ),
    );
  }
}