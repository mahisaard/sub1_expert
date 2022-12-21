import 'package:dartz/dartz.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';
import 'package:module_common/common/failure.dart';
import '../repositories/televisi_repository.dart';

class RemoveWatchlistTelevisi {
  final TelevisiRepository repository;

  RemoveWatchlistTelevisi(this.repository);

  Future<Either<Failure, String>> execute(TelevisiDetail televisi) {
    return repository.removeWatchlistTelevisi(televisi);
  }
}