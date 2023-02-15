part of 'utilities.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail/:id',
          builder: (BuildContext context, GoRouterState state) {
            return DetailScreen(id: int.parse(state.params['id']!));
          },
        ),
      ],
    ),
  ],
);
