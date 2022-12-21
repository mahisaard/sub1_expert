import 'package:dartz/dartz.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_movies/domain/entities/movie_detail.dart';
import '../repositories/movie_repository.dart';

class RemoveWatchlist {
  final MovieRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
