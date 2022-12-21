import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/usecases/get_televisi_detail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTelevisiDetail usecase;
  late MockTelevisiRepository mockTelevisiRepository;

  setUp(() {
    mockTelevisiRepository = MockTelevisiRepository();
    usecase = GetTelevisiDetail(mockTelevisiRepository);
  });

  final tId = 1;

  test('should get televisi detail from the repository', () async {
    // arrange
    when(mockTelevisiRepository.getTelevisiDetail(tId))
        .thenAnswer((_) async => Right(testTelevisiDetail));
    // act
    final result = await usecase.execute(tId);
    // assert
    expect(result, Right(testTelevisiDetail));
  });
}