import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/usecases/save_watchlist_televisi.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTelevisi usecase;
  late MockTelevisiRepository mockTelevisiRepository;

  setUp(() {
    mockTelevisiRepository = MockTelevisiRepository();
    usecase = SaveWatchlistTelevisi(mockTelevisiRepository);
  });

  test('should save televisi to the repository', () async {
    // arrange
    when(mockTelevisiRepository.saveWatchlistTelevisi(testTelevisiDetail))
        .thenAnswer((_) async => const Right('Added to Watchlist Televisi'));
    // act
    final result = await usecase.execute(testTelevisiDetail);
    // assert
    verify(mockTelevisiRepository.saveWatchlistTelevisi(testTelevisiDetail));
    expect(result, const Right('Added to Watchlist Televisi'));
  });
}
