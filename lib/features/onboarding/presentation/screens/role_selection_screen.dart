import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/providers/role_provider.dart';

class RoleSelectionScreen extends ConsumerWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(roleProvider);

    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: null, // No title – question is inside the card
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            color: Colors.white, // Solid white card
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              child: loading
                  ? const SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF2575FC),
                  ),
                ),
              )
                  : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Whose device is this?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 28),
                  // Option 1: Mine
                  _buildOptionTile(
                    context: context,
                    ref: ref,
                    icon: Icons.person_outline, // Replace with your image
                    title: "Mine",
                    subtitle: "I will use it to manage my child's device",
                    onTap: loading
                        ? null
                        : () async {
                      final success = await ref
                          .read(roleProvider.notifier)
                          .saveRole("parent");
                      if (success && context.mounted) {
                        context.push("/pairing_parent");
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  // Option 2: My Child's
                  _buildOptionTile(
                    context: context,
                    ref: ref,
                    icon: Icons.child_care_outlined, // Replace with your image
                    title: "My Child's",
                    subtitle: "I want to supervise this device",
                    onTap: loading
                        ? null
                        : () async {
                      final success = await ref
                          .read(roleProvider.notifier)
                          .saveRole("child");
                      if (success && context.mounted) {
                        context.push("/child");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required BuildContext context,
    required WidgetRef ref,
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Replace this Icon with your own Image.asset or Image.network
              Icon(icon, size: 28, color: const Color(0xFF2575FC)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}