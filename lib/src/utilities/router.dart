part of 'utilities.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        BlocProvider.of<MovieBloc>(context).add(FetchMovie());
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'detail/:id',
          builder: (BuildContext context, GoRouterState state) {
            BlocProvider.of<PoinCubit>(context).increment();
            BlocProvider.of<DetailMovieBloc>(context)
                .add(FetchDetailMovie(int.parse(state.params['id']!)));
            return DetailScreen(id: int.parse(state.params['id']!));
          },
        ),
      ],
    ),
  ],
);
