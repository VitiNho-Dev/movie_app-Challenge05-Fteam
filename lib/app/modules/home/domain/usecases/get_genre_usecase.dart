import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/modules/home/domain/repositories/genre_repository.dart';

abstract class IGetGenreUsecase {
  Future<Either<Failures, List<Genre>>> call();
}

class GetGenreUsecase implements IGetGenreUsecase {
  final GenreRepository repository;

  GetGenreUsecase(this.repository);

  @override
  Future<Either<Failures, List<Genre>>> call() {
    final result = repository.pickUpGenres();
    try {
      return result;
    } on Failures catch (e) {
      GenreDatasourceNoInternetConnection(message: e.toString());
    }
    return result;
  }
}
