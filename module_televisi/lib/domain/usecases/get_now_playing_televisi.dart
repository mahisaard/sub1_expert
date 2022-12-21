import 'package:dartz/dartz.dart';
import '../entities/televisi.dart';
import '../repositories/televisi_repository.dart';
import 'package:module_common/common/failure.dart';

class GetNowPlayingTelevisi {
  final TelevisiRepository repository;

  GetNowPlayingTelevisi(this.repository);

  Future<Either<Failure, List<Televisi>>> execute() {
    return repository.getNowPlayingTelevisi();
  }
}
