// Mocks generated by Mockito 5.3.2 from annotations
// in module_televisi/test/presentation/bloc/televisi_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:module_common/common/failure.dart' as _i6;
import 'package:module_televisi/domain/entities/televisi.dart' as _i7;
import 'package:module_televisi/domain/entities/televisi_detail.dart' as _i13;
import 'package:module_televisi/domain/repositories/televisi_repository.dart'
    as _i2;
import 'package:module_televisi/domain/usecases/get_now_playing_televisi.dart'
    as _i4;
import 'package:module_televisi/domain/usecases/get_popular_televisi.dart'
    as _i8;
import 'package:module_televisi/domain/usecases/get_televisi_detail.dart'
    as _i12;
import 'package:module_televisi/domain/usecases/get_televisi_recommendations.dart'
    as _i10;
import 'package:module_televisi/domain/usecases/get_top_rated_televisi.dart'
    as _i9;
import 'package:module_televisi/domain/usecases/get_watchlist_status_televisi.dart'
    as _i15;
import 'package:module_televisi/domain/usecases/get_watchlist_televisi.dart'
    as _i14;
import 'package:module_televisi/domain/usecases/remove_watchlist_televisi.dart'
    as _i17;
import 'package:module_televisi/domain/usecases/save_watchlist_televisi.dart'
    as _i16;
import 'package:module_televisi/domain/usecases/search_televisi.dart' as _i11;

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

/// A class which mocks [GetNowPlayingTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingTelevisi extends _i1.Mock
    implements _i4.GetNowPlayingTelevisi {
  MockGetNowPlayingTelevisi() {
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
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>);
}

/// A class which mocks [GetPopularTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTelevisi extends _i1.Mock
    implements _i8.GetPopularTelevisi {
  MockGetPopularTelevisi() {
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
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>);
}

/// A class which mocks [GetTopRatedTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTelevisi extends _i1.Mock
    implements _i9.GetTopRatedTelevisi {
  MockGetTopRatedTelevisi() {
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
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>);
}

/// A class which mocks [GetTelevisiRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTelevisiRecommendations extends _i1.Mock
    implements _i10.GetTelevisiRecommendations {
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
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>);
}

/// A class which mocks [SearchTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTelevisi extends _i1.Mock implements _i11.SearchTelevisi {
  MockSearchTelevisi() {
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
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>> execute(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>);
}

/// A class which mocks [GetTelevisiDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTelevisiDetail extends _i1.Mock implements _i12.GetTelevisiDetail {
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
  _i5.Future<_i3.Either<_i6.Failure, _i13.TelevisiDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i13.TelevisiDetail>>.value(
                _FakeEither_1<_i6.Failure, _i13.TelevisiDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i13.TelevisiDetail>>);
}

/// A class which mocks [GetWatchlistTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTelevisi extends _i1.Mock
    implements _i14.GetWatchlistTelevisi {
  MockGetWatchlistTelevisi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.Televisi>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.Televisi>>>);
}

/// A class which mocks [GetWatchListStatusTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusTelevisi extends _i1.Mock
    implements _i15.GetWatchListStatusTelevisi {
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
    implements _i16.SaveWatchlistTelevisi {
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
          _i13.TelevisiDetail? televisi) =>
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
    implements _i17.RemoveWatchlistTelevisi {
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
          _i13.TelevisiDetail? televisi) =>
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
