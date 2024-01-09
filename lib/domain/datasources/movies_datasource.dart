import 'package:witflex/domain/entities/entities.dart';

abstract class MoviesDatasource {
  // Future<List<Movie>> getNowPlaying({ int page = 1 });
  Future<List<Movie>> getNowPlaying( {  int page = 1 });
  Future<List<Movie>> getPopularPlaying( {  int page = 1 });
  Future<List<Movie>> getTopRatedPlaying( {  int page = 1 }); // los mas vistos
  Future<List<Movie>> getUpcoming({ int page = 1 }); // proximos estrenos
}
