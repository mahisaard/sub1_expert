import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/usecases/search_televisi.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTelevisi usecase;
  late MockTelevisiRepository mockTelevisiRepository;

  setUp(() {
    mockTelevisiRepository = MockTelevisiRepository();
    usecase = SearchTelevisi(mockTelevisiRepository);
  });

  final tTelevisi = <Televisi>[];
  final tQuery = 'Spiderman';

  test('should get list of televisi from the repository', () async {
    // arrange
    when(mockTelevisiRepository.searchTelevisi(tQuery))
        .thenAnswer((_) async => Right(tTelevisi));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTelevisi));
  });
}
