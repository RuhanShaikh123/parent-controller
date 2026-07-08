import 'package:flutter/material.dart';

import '../widget/activity_card.dart';
import '../widget/child_status_card.dart';
import '../widget/dashboard_grid.dart';
import '../widget/recent_activity_card.dart';

class ParentDashboardScreen extends StatelessWidget {

  final String familyId;

  const ParentDashboardScreen({
    super.key,
    required this.familyId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F8FC),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,

        title: const Text(
          "Family Dashboard",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.black87,
            ),
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            const ChildStatusCard(),

            const SizedBox(height: 22),

            const ActivityCard(),

            const SizedBox(height: 28),

            const Text(
              "Live Monitoring",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            DashboardGrid(
              familyId: familyId,
            ),

            const SizedBox(height: 28),

            const Text(
              "Recent Activity",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            const RecentActivityCard(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}