

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:witflex/infrastructure/datasources/moviedb_datasource.dart';
import 'package:witflex/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MovieDBDatasource() ) ;
});