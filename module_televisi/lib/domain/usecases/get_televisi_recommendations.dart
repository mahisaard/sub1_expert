import 'package:dartz/dartz.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';

class GetTelevisiRecommendations {
  final TelevisiRepository repository;

  GetTelevisiRecommendations(this.repository);

  Future<Either<Failure, List<Televisi>>> execute(id) {
    return repository.getTelevisiRecommendations(id);
  }
}