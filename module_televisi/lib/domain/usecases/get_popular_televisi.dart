import 'package:dartz/dartz.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';
import 'package:module_common/common/failure.dart';

class GetPopularTelevisi {
  final TelevisiRepository repository;

  GetPopularTelevisi(this.repository);

  Future<Either<Failure, List<Televisi>>> execute() {
    return repository.getPopularTelevisi();
  }
}