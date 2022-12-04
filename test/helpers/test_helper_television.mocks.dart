// Mocks generated by Mockito 5.3.2 from annotations
// in ditonton/test/helpers/test_helper_television.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i16;
import 'dart:typed_data' as _i17;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/failure.dart' as _i7;
import 'package:ditonton/data/datasources/data_lokal/televisi_data_lokal_source.dart'
    as _i12;
import 'package:ditonton/data/datasources/data_remote/televisi_data_remote_source.dart'
    as _i10;
import 'package:ditonton/data/datasources/db/database_televisi_helper.dart'
    as _i14;
import 'package:ditonton/data/models/televisi_model/televisi_detail_model.dart'
    as _i3;
import 'package:ditonton/data/models/televisi_model/televisi_model.dart'
    as _i11;
import 'package:ditonton/data/models/televisi_model/televisi_table.dart'
    as _i13;
import 'package:ditonton/domain/entities/televisi_entities/televisi.dart'
    as _i8;
import 'package:ditonton/domain/entities/televisi_entities/televisi_detail.dart'
    as _i9;
import 'package:ditonton/domain/repositories/televisi_repository.dart' as _i5;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i15;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTelevisiDetailResponse_1 extends _i1.SmartFake
    implements _i3.TelevisiDetailResponse {
  _FakeTelevisiDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TelevisiRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTelevisiRepository extends _i1.Mock
    implements _i5.TelevisiRepository {
  MockTelevisiRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>
      getNowPlayingTelevisi() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTelevisi,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.Televisi>>(
              this,
              Invocation.method(
                #getNowPlayingTelevisi,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>
      getPopularTelevisi() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTelevisi,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.Televisi>>(
              this,
              Invocation.method(
                #getPopularTelevisi,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>
      getTopRatedTelevisi() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTelevisi,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.Televisi>>(
              this,
              Invocation.method(
                #getTopRatedTelevisi,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.TelevisiDetail>> getTelevisiDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTelevisiDetail,
          [id],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, _i9.TelevisiDetail>>.value(
                _FakeEither_0<_i7.Failure, _i9.TelevisiDetail>(
          this,
          Invocation.method(
            #getTelevisiDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.TelevisiDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>
      getTelevisiRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTelevisiRecommendations,
              [id],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.Televisi>>(
              this,
              Invocation.method(
                #getTelevisiRecommendations,
                [id],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>> searchTelevisi(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTelevisi,
          [query],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.Televisi>>(
          this,
          Invocation.method(
            #searchTelevisi,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistTelevisi(
          _i9.TelevisiDetail? televisi) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTelevisi,
          [televisi],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTelevisi,
            [televisi],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlistTelevisi(
          _i9.TelevisiDetail? televisi) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTelevisi,
          [televisi],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlistTelevisi,
            [televisi],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlistTelevisi(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlistTelevisi,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>
      getWatchlistTelevisi() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTelevisi,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i8.Televisi>>(
              this,
              Invocation.method(
                #getWatchlistTelevisi,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Televisi>>>);
}

/// A class which mocks [TelevisiRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTelevisiRemoteDataSource extends _i1.Mock
    implements _i10.TelevisiRemoteDataSource {
  MockTelevisiRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.TelevisiModel>> getNowPlayingTelevisi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTelevisi,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TelevisiModel>>.value(<_i11.TelevisiModel>[]),
      ) as _i6.Future<List<_i11.TelevisiModel>>);
  @override
  _i6.Future<List<_i11.TelevisiModel>> getPopularTelevisi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTelevisi,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TelevisiModel>>.value(<_i11.TelevisiModel>[]),
      ) as _i6.Future<List<_i11.TelevisiModel>>);
  @override
  _i6.Future<List<_i11.TelevisiModel>> getTopRatedTelevisi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTelevisi,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.TelevisiModel>>.value(<_i11.TelevisiModel>[]),
      ) as _i6.Future<List<_i11.TelevisiModel>>);
  @override
  _i6.Future<_i3.TelevisiDetailResponse> getTelevisiDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTelevisiDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.TelevisiDetailResponse>.value(
            _FakeTelevisiDetailResponse_1(
          this,
          Invocation.method(
            #getTelevisiDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.TelevisiDetailResponse>);
  @override
  _i6.Future<List<_i11.TelevisiModel>> getTelevisiRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTelevisiRecommendations,
          [id],
        ),
        returnValue:
            _i6.Future<List<_i11.TelevisiModel>>.value(<_i11.TelevisiModel>[]),
      ) as _i6.Future<List<_i11.TelevisiModel>>);
  @override
  _i6.Future<List<_i11.TelevisiModel>> searchTelevisi(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTelevisi,
          [query],
        ),
        returnValue:
            _i6.Future<List<_i11.TelevisiModel>>.value(<_i11.TelevisiModel>[]),
      ) as _i6.Future<List<_i11.TelevisiModel>>);
}

/// A class which mocks [TelevisiDataLokalSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTelevisiDataLokalSource extends _i1.Mock
    implements _i12.TelevisiDataLokalSource {
  MockTelevisiDataLokalSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTelevisi(_i13.TelevisiTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTelevisi,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTelevisi(_i13.TelevisiTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTelevisi,
          [tv],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i13.TelevisiTable?> getTelevisiById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTelevisiById,
          [id],
        ),
        returnValue: _i6.Future<_i13.TelevisiTable?>.value(),
      ) as _i6.Future<_i13.TelevisiTable?>);
  @override
  _i6.Future<List<_i13.TelevisiTable>> getWatchlistTelevisi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTelevisi,
          [],
        ),
        returnValue:
            _i6.Future<List<_i13.TelevisiTable>>.value(<_i13.TelevisiTable>[]),
      ) as _i6.Future<List<_i13.TelevisiTable>>);
}

/// A class which mocks [DatabaseHelperTelevisi].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTelevisi extends _i1.Mock
    implements _i14.DatabaseHelperTelevisi {
  MockDatabaseHelperTelevisi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i15.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i15.Database?>.value(),
      ) as _i6.Future<_i15.Database?>);
  @override
  _i6.Future<int> insertWatchlistTelevisi(_i13.TelevisiTable? televisi) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTelevisi,
          [televisi],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTelevisi(_i13.TelevisiTable? televisi) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTelevisi,
          [televisi],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTelevisiById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTelevisiById,
          [id],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTelevisi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTelevisi,
          [],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i16.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i17.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i17.Uint8List>.value(_i17.Uint8List(0)),
      ) as _i6.Future<_i17.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
