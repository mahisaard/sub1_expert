import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:module_common/common/exception.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_televisi/data/datasources/televisi_data_lokal_source.dart';
import 'package:module_televisi/data/models/televisi_table.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';

import '../datasources/televisi_data_remote_source.dart';


class TelevisiRepositoryImpl implements TelevisiRepository {
  final TelevisiRemoteDataSource remoteDataSource;
  final TelevisiDataLokalSource localDataSource;

  TelevisiRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Televisi>>> getNowPlayingTelevisi() async {
    try {
      final result = await remoteDataSource.getNowPlayingTelevisi();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TelevisiDetail>> getTelevisiDetail(int id) async {
    try {
      final result = await remoteDataSource.getTelevisiDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Televisi>>> getTelevisiRecommendations(int id) async {
    try {
      final result = await remoteDataSource.getTelevisiRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Televisi>>> getPopularTelevisi() async {
    try {
      final result = await remoteDataSource.getPopularTelevisi();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Televisi>>> getTopRatedTelevisi() async {
    try {
      final result = await remoteDataSource.getTopRatedTelevisi();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Televisi>>> searchTelevisi(String query) async {
    try {
      final result = await remoteDataSource.searchTelevisi(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTelevisi(TelevisiDetail televisi) async {
    try {
      final result =
        await localDataSource.insertWatchlistTelevisi(TelevisiTable.fromEntity(televisi));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTelevisi(TelevisiDetail televisi) async {
    try {
      final result =
      await localDataSource.removeWatchlistTelevisi(TelevisiTable.fromEntity(televisi));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlistTelevisi(int id) async {
    final result = await localDataSource.getTelevisiById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Televisi>>> getWatchlistTelevisi() async {
    final result = await localDataSource.getWatchlistTelevisi();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}