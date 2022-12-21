import 'package:dartz/dartz.dart';
import 'package:module_common/common/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';


class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
