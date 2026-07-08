import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/dashboard_provider.dart';


class ChildStatusCard extends ConsumerWidget {
  const ChildStatusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = ref.watch(dashboardProvider);

    return child.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

      error: (e, _) => Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(e.toString()),
        ),
      ),

      data: (data) {
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
              ),
            ],
          ),
          child: Row(
            children: [

              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  data["firstName"][0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "${data["firstName"]} ${data["lastName"]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      data["deviceName"]?.toString() ?? "Unknown Device",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [

                        Icon(
                          Icons.circle,
                          size: 10,
                          color: data["paired"]
                              ? Colors.green
                              : Colors.red,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          data["paired"]
                              ? "Connected"
                              : "Disconnected",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}