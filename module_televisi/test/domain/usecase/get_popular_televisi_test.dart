import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/usecases/get_popular_televisi.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTelevisi usecase;
  late MockTelevisiRepository mockTelevisiRpository;

  setUp(() {
    mockTelevisiRpository = MockTelevisiRepository();
    usecase = GetPopularTelevisi(mockTelevisiRpository);
  });

  final tTelevisi = <Televisi>[];

  group('GetPopularTelevisi Tests', () {
    group('execute', () {
      test(
          'should get list of televisi from the repository when execute function is called',
              () async {
            // arrange
            when(mockTelevisiRpository.getPopularTelevisi())
                .thenAnswer((_) async => Right(tTelevisi));
            // act
            final result = await usecase.execute();
            // assert
            expect(result, Right(tTelevisi));
          });
    });
  });
}
