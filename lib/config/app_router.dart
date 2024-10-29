
import 'package:examen_flutter/config/app_route_names.dart';
import 'package:examen_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:examen_flutter/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:go_router/go_router.dart';

get router => _router;

final _router = GoRouter(
  initialLocation: AppRouteNames.onboarding.path,
  routes: [
    GoRoute(
      path: AppRouteNames.onboarding.path,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouteNames.home.path,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);