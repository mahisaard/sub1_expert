import 'package:dartz/dartz.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';
import 'package:module_common/common/failure.dart';

class GetTelevisiDetail {
  final TelevisiRepository repository;

  GetTelevisiDetail(this.repository);

  Future<Either<Failure, TelevisiDetail>> execute(int id) {
    return repository.getTelevisiDetail(id);
  }
}
