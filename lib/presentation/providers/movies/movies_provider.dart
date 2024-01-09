import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:witflex/domain/entities/entities.dart';
import 'package:witflex/presentation/providers/movies/movies_repostory_provider.dart';

final nowPlayingMovieProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final cargarPeliculas = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: cargarPeliculas);
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final cargarPeliculas = ref.watch(movieRepositoryProvider).getPopularPlaying;
  return MoviesNotifier(fetchMoreMovies: cargarPeliculas);
});


final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final cargarPeliculas = ref.watch(movieRepositoryProvider).getTopRatedPlaying;
  return MoviesNotifier(fetchMoreMovies: cargarPeliculas);
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final cargarPeliculas = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fetchMoreMovies: cargarPeliculas);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 5000));
    isLoading = false;
  }
}
