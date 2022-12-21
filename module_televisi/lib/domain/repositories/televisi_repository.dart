import 'package:dartz/dartz.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';
import '../entities/televisi.dart';


abstract class TelevisiRepository {
  Future<Either<Failure, List<Televisi>>> getNowPlayingTelevisi();
  Future<Either<Failure, List<Televisi>>> getPopularTelevisi();
  Future<Either<Failure, List<Televisi>>> getTopRatedTelevisi();
  Future<Either<Failure, TelevisiDetail>> getTelevisiDetail(int id);
  Future<Either<Failure, List<Televisi>>> getTelevisiRecommendations(int id);
  Future<Either<Failure, List<Televisi>>> searchTelevisi(String query);
  Future<Either<Failure, String>> saveWatchlistTelevisi(TelevisiDetail televisi);
  Future<Either<Failure, String>> removeWatchlistTelevisi(TelevisiDetail televisi);
  Future<bool> isAddedToWatchlistTelevisi(int id);
  Future<Either<Failure, List<Televisi>>> getWatchlistTelevisi();
}
