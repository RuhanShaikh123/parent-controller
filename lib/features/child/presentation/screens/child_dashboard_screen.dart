import 'package:flutter/material.dart';

class ChildDashboardScreen extends StatelessWidget {
  const ChildDashboardScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context,
      ) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Child Dashboard",
        ),
      ),

      body: const Center(

        child: Text(
          "Child Dashboard",
        ),

      ),

    );

  }

}