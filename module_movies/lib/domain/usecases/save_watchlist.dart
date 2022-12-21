import 'package:dartz/dartz.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_movies/domain/entities/movie_detail.dart';
import 'package:module_movies/domain/repositories/movie_repository.dart';


class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
