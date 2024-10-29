class AppRouteNames {
  AppRouteNames._();

  static const RouteName onboarding = RouteName(
    name: 'onboarding',
    path: '/',
  );

  static const RouteName home = RouteName(
    name: 'home',
    path: '/home',
  );
}

class RouteName {
  const RouteName({required this.name, required this.path});

  final String name;
  final String path;
}
