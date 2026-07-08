import 'package:flutter/material.dart';
import '../features/router/app_router.dart';


class ParentControllerApp extends StatelessWidget {
  const ParentControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: appRouter,
    );
  }
}
