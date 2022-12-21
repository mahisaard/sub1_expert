import 'package:dartz/dartz.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';
import 'package:module_common/common/failure.dart';

class SearchTelevisi {
  final TelevisiRepository repository;

  SearchTelevisi(this.repository);

  Future<Either<Failure, List<Televisi>>> execute(String query) {
    return repository.searchTelevisi(query);
  }
}
