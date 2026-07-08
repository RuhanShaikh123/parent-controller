import 'package:go_router/go_router.dart';
import 'package:parent_controller/botton_nave/bottom_nav.dart';
import '../../pairing/screens/parent_pair_screen.dart';
import '../auth/presentation/screens/login_screen.dart';
import '../auth/presentation/screens/register_screen.dart';
import '../child/presentation/screens/child_dashboard_screen.dart';
import '../live_audio/presentation/screens/live_audio_screen.dart';
import '../live_camera/presentation/screens/live_camera_screen.dart';
import '../location/presentation/screens/location_screen.dart';
import '../onboarding/presentation/screens/role_selection_screen.dart';
import '../onboarding/presentation/screens/splash_screen.dart';
import '../parent/presentation/screens/parent_dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",

  routes: [

    GoRoute(
      path: "/",
      builder: (
          context,
          state,
          ) =>
      const SplashScreen(),
    ),

    GoRoute(
      path: "/live_camera",
      builder: (context, state) {
        final familyId = state.extra as String;

        return LiveCameraScreen(
          familyId: familyId,
        );
      },
    ),

    GoRoute(
      path: "/live_audio",
      builder: (context, state) {

        final familyId = state.extra as String;

        return LiveAudioScreen(
          familyId: familyId,
        );
      },
    ),

    GoRoute(
      path: "/login",
      builder: (
          context,
          state,
          ) =>
      const LoginScreen(),
    ),

    GoRoute(
      path: "/register",
      builder: (
          context,
          state,
          ) =>
      const RegisterScreen(),
    ),

    GoRoute(
      path: "/role",
      builder: (
          context,
          state,
          ) =>
      const RoleSelectionScreen(),
    ),

    GoRoute(
      path: "/location",
      builder: (context, state) =>
      const LiveLocationScreen(),
    ),

    GoRoute(
      path: "/parent_dashboard",
      builder: (context, state) {

        final familyId = state.extra as String;

        return ParentDashboardScreen(
          familyId: familyId,
        );
      },
    ),
    GoRoute(
      path: "/pairing_parent",
      builder: (
          context,
          state,
          ) =>
      const ParentPairScreen(),
    ),



    GoRoute(
      path: "/child",
      builder: (
          context,
          state,
            ) =>
      const ChildDashboardScreen(),
    ),

    GoRoute(
      path: "/bottom_nav",
      builder: (context, state) {
        final familyId = state.extra as String;

        return BottomNavigation(
          familyId: familyId,
        );
      },
    ),

  ],
);