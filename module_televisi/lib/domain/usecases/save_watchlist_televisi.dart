import 'package:dartz/dartz.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';
import '../repositories/televisi_repository.dart';

class SaveWatchlistTelevisi {
  final TelevisiRepository repository;

  SaveWatchlistTelevisi(this.repository);

  Future<Either<Failure, String>> execute(TelevisiDetail televisi) {
    return repository.saveWatchlistTelevisi(televisi);
  }
}
