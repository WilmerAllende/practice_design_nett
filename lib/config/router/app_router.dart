import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/movies",
      builder: (context, state) => const MoviesHome(),

      routes: [
         GoRoute(
          path: 'movie/:id',
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';

            return MovieDetail( movieId: movieId );
          },
        ),
      ]

    ),

  ]
);
