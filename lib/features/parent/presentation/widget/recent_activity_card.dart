import 'package:flutter/material.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  Widget tile(
      IconData icon,
      String title,
      String time,
      ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Icon(icon, color: Colors.blue),
      ),

      title: Text(title),

      subtitle: Text(time),

      trailing: const Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        children: [

          tile(
            Icons.location_on,
            "Location Updated",
            "2 minutes ago",
          ),

          const Divider(),

          tile(
            Icons.phone_android,
            "YouTube Opened",
            "10 minutes ago",
          ),

          const Divider(),

          tile(
            Icons.mic,
            "Microphone Session",
            "30 minutes ago",
          ),
        ],
      ),
    );
  }
}