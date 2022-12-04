// Mocks generated by Mockito 5.3.2 from annotations
// in ditonton/test/presentation/provider/televisi_provider/televisi_detail_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:ditonton/common/failure.dart' as _i6;
import 'package:ditonton/domain/entities/televisi_entities/televisi.dart'
    as _i9;
import 'package:ditonton/domain/entities/televisi_entities/televisi_detail.dart'
    as _i7;
import 'package:ditonton/domain/repositories/televisi_repository.dart' as _i2;
import 'package:ditonton/domain/usecases/televisi_usecase/get_televisi_detail.dart'
    as _i4;
import 'package:ditonton/domain/usecases/televisi_usecase/get_televisi_recommendations.dart'
    as _i8;
import 'package:ditonton/domain/usecases/televisi_usecase/get_watchlist_status_televisi.dart'
    as _i10;
import 'package:ditonton/domain/usecases/televisi_usecase/remove_watchlist_televisi.dart'
    as _i12;
import 'package:ditonton/domain/usecases/televisi_usecase/save_watchlist_televisi.dart'
    as _i11;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTelevisiRepository_0 extends _i1.SmartFake
    implements _i2.TelevisiRepository {
  _FakeTelevisiRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetTelevisiDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTelevisiDetail extends _i1.Mock implements _i4.GetTelevisiDetail {
  MockGetTelevisiDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TelevisiRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTelevisiRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TelevisiRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisiDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisiDetail>>.value(
                _FakeEither_1<_i6.Failure, _i7.TelevisiDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.TelevisiDetail>>);
}

/// A class which mocks [GetTelevisiRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTelevisiRecommendations extends _i1.Mock
    implements _i8.GetTelevisiRecommendations {
  MockGetTelevisiRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TelevisiRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTelevisiRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TelevisiRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i9.Televisi>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i9.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i9.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i9.Televisi>>>);
}

/// A class which mocks [GetWatchListStatusTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusTelevisi extends _i1.Mock
    implements _i10.GetWatchListStatusTelevisi {
  MockGetWatchListStatusTelevisi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TelevisiRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTelevisiRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TelevisiRepository);
  @override
  _i5.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [SaveWatchlistTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTelevisi extends _i1.Mock
    implements _i11.SaveWatchlistTelevisi {
  MockSaveWatchlistTelevisi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TelevisiRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTelevisiRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TelevisiRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(
          _i7.TelevisiDetail? televisi) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [televisi],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [televisi],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTelevisi extends _i1.Mock
    implements _i12.RemoveWatchlistTelevisi {
  MockRemoveWatchlistTelevisi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TelevisiRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTelevisiRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TelevisiRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(
          _i7.TelevisiDetail? televisi) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [televisi],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [televisi],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
