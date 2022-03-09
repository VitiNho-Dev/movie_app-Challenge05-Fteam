import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/module/home/domain/errors/failures.dart';

abstract class MovieDatasource {
  Future<Either<Failures, List<Movie>>> getMoviesFromNetwork();
}
