import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/usecases/remove_watchlist_televisi.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTelevisi usecase;
  late MockTelevisiRepository mockTelevisiRepository;

  setUp(() {
    mockTelevisiRepository = MockTelevisiRepository();
    usecase = RemoveWatchlistTelevisi(mockTelevisiRepository);
  });

  test('should remove watchlist televisi from repository', () async {
    // arrange
    when(mockTelevisiRepository.removeWatchlistTelevisi(testTelevisiDetail))
        .thenAnswer((_) async => Right('Removed from watchlist Televisi'));
    // act
    final result = await usecase.execute(testTelevisiDetail);
    // assert
    verify(mockTelevisiRepository.removeWatchlistTelevisi(testTelevisiDetail));
    expect(result, Right('Removed from watchlist Televisi'));
  });
}
