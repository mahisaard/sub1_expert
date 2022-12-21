import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/usecases/get_watchlist_televisi.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';


void main() {
  late GetWatchlistTelevisi usecase;
  late MockTelevisiRepository mockTelevisiRepository;

  setUp(() {
    mockTelevisiRepository = MockTelevisiRepository();
    usecase = GetWatchlistTelevisi(mockTelevisiRepository);
  });

  test('should get list of televisi from the repository', () async {
    // arrange
    when(mockTelevisiRepository.getWatchlistTelevisi())
        .thenAnswer((_) async => Right(testTelevisiList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTelevisiList));
  });
}