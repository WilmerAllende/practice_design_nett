import 'package:witflex/domain/datasources/movies_datasource.dart';
import 'package:witflex/domain/entities/movie.dart';
import 'package:witflex/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopularPlaying({int page = 1}) {
    return datasource.getPopularPlaying(page: page);
  }

  @override
  Future<List<Movie>> getTopRatedPlaying({int page = 1}) {
    return datasource.getTopRatedPlaying(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
}
