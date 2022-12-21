import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/usecases/get_top_rated_televisi.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTopRatedTelevisi usecase;
  late MockTelevisiRepository mockTelevisiRepository;

  setUp(() {
    mockTelevisiRepository = MockTelevisiRepository();
    usecase = GetTopRatedTelevisi(mockTelevisiRepository);
  });

  final tTelevisi = <Televisi>[];

  test('should get list of televisi from repository', () async {
    // arrange
    when(mockTelevisiRepository.getTopRatedTelevisi())
        .thenAnswer((_) async => Right(tTelevisi));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTelevisi));
  });
}
