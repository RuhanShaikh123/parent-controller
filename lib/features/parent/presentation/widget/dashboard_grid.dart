import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dashboard_tile.dart';

class DashboardGrid extends StatelessWidget {

  final String familyId;

  const DashboardGrid({
    super.key,
    required this.familyId,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      childAspectRatio: .95,

      children: [

        DashboardTile(
          icon: Icons.mic,
          title: "Live Audio",
          subtitle: "Listen remotely",
          color: Colors.blue,
          onTap: () {
            context.push(
              "/live_audio",
              extra: familyId,
            );
          },
        ),

        DashboardTile(
          icon: Icons.videocam,
          title: "Remote Camera",
          subtitle: "View surroundings",
          color: Colors.green,
          onTap: () {
            context.push(
              "/live_camera",
              extra: familyId,
            );
          },
        ),

        DashboardTile(
          icon: Icons.location_pin,
          title: "Location",
          subtitle: "Track child",
          color: Colors.red,
          onTap: () {},
        ),

        DashboardTile(
          icon: Icons.screen_share,
          title: "Screen Mirror",
          subtitle: "Live Screen",
          color: Colors.deepPurple,
          onTap: () {},
        ),

        DashboardTile(
          icon: Icons.apps,
          title: "Installed Apps",
          subtitle: "Manage apps",
          color: Colors.orange,
          onTap: () {},
        ),

        DashboardTile(
          icon: Icons.lock,
          title: "App Blocker",
          subtitle: "Restrict apps",
          color: Colors.teal,
          onTap: () {},
        ),
      ],
    );
  }
}
