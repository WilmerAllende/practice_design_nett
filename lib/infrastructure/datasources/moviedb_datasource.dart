import 'package:dio/dio.dart';
import 'package:witflex/config/constants/environment.dart';
import 'package:witflex/domain/datasources/movies_datasource.dart';
import 'package:witflex/domain/entities/movie.dart';
import 'package:witflex/infrastructure/models/models.dart';

import '../mappers/mappers.dart';

class MovieDBDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1})  async {
    final response = await dio.get("/movie/now_playing", 
          queryParameters: {
            'page': page
          }
    );
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopularPlaying({int page = 1}) async {
    final response = await dio.get('/movie/popular', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);    
  }

  @override
  Future<List<Movie>> getTopRatedPlaying({int page = 1})  async{
    final response = await dio.get('/movie/top_rated', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);  
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1})  async {
    final response = await dio.get('/movie/upcoming', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);   
  }
}
