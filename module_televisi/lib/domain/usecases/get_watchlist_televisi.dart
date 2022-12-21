import 'package:dartz/dartz.dart';
import '../entities/televisi.dart';
import '../repositories/televisi_repository.dart';
import 'package:module_common/common/failure.dart';

class GetWatchlistTelevisi {
  final TelevisiRepository _repository;

  GetWatchlistTelevisi(this._repository);

  Future<Either<Failure, List<Televisi>>> execute() {
    return _repository.getWatchlistTelevisi();
  }
}