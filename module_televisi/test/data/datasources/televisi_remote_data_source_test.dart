import 'dart:convert';
import 'dart:io';


import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:module_common/common/exception.dart';
import 'package:module_televisi/data/datasources/televisi_data_remote_source.dart';
import 'package:module_televisi/data/models/televisi_detail_model.dart';
import 'package:module_televisi/data/models/televisi_respon.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';


void main() {
  const API_KEY = 'api_key=6b71ad3b084c7e3fe1b6af98384ad19b';
  const BASE_URL = 'https://api.themoviedb.org/3';

  late TelevisiRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TelevisiRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Now Playing Televisi', () {
    final tTelevisiList = TelevisiResponse.fromJson(
        json.decode(readJson('dummy_data/now_playing_televisi.json')))
        .televisiList;

    test('should return list of Televisi Model when the response code is 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/now_playing_televisi.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
                  }
              ));
          // act
          final result = await dataSource.getNowPlayingTelevisi();
          // assert
          expect(result, equals(tTelevisiList));
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getNowPlayingTelevisi();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Popular Televisi', () {
    final tTelevisiList =
        TelevisiResponse.fromJson(json.decode(readJson('dummy_data/popular_televisi.json')))
            .televisiList;

    test('should return list of televisi when response is success (200)',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/popular_televisi.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
                  }
              ));
          // act
          final result = await dataSource.getPopularTelevisi();
          // assert
          expect(result, tTelevisiList);
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getPopularTelevisi();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Top Rated Televisi', () {
    final tTelevisiList = TelevisiResponse.fromJson(
        json.decode(readJson('dummy_data/top_rated_televisi.json')))
        .televisiList;

    test('should return list of televisi when response code is 200 ', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/top_rated_televisi.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
              }
          ));
      // act
      final result = await dataSource.getTopRatedTelevisi();
      // assert
      expect(result, tTelevisiList);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getTopRatedTelevisi();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get televisi detail', () {
    const tId = 1;
    final tTelevisiDetail = TelevisiDetailResponse.fromJson(
        json.decode(readJson('dummy_data/televisi_detail.json')));

    test('should return televisi detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/televisi_detail.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
              }
          ));
      // act
      final result = await dataSource.getTelevisiDetail(tId);
      // assert
      expect(result, equals(tTelevisiDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getTelevisiDetail(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get televisi recommendations', () {
    final tTelevisiList = TelevisiResponse.fromJson(
        json.decode(readJson('dummy_data/televisi_recommendations.json')))
        .televisiList;
    const tId = 1;

    test('should return list of Televisi Model when the response code is 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
              .thenAnswer((_) async => http.Response(
              readJson('dummy_data/televisi_recommendations.json'), 200,
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
              }
          ));
          // act
          final result = await dataSource.getTelevisiRecommendations(tId);
          // assert
          expect(result, equals(tTelevisiList));
        });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/$tId/recommendations?$API_KEY')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getTelevisiRecommendations(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('search televisi', () {
    final tSearchResult = TelevisiResponse.fromJson(
        json.decode(readJson('dummy_data/search_televisi.json')))
        .televisiList;
    const tQuery = 'Travessia';

    test('should return list of televisi when response code is 200', () async {
      // arrange
      when(mockHttpClient
          .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/search_televisi.json'), 200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          }
      ));
      // act
      final result = await dataSource.searchTelevisi(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$tQuery')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.searchTelevisi(tQuery);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });
}
