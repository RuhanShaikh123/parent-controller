import 'package:flutter/material.dart';
import 'package:parent_controller/features/location/presentation/screens/location_screen.dart';
import 'package:parent_controller/features/parent/presentation/screens/parent_dashboard_screen.dart';
import 'package:parent_controller/features/settings/presentation/screens/settings_screen.dart';

class BottomNavigation extends StatefulWidget {
  final String familyId;

  const BottomNavigation({
    super.key,
    required this.familyId,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      ParentDashboardScreen(
        familyId: widget.familyId,
      ),
      const LiveLocationScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}