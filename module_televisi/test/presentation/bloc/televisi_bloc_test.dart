import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:module_common/common/failure.dart';
import 'package:module_common/module_common.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/usecases/get_now_playing_televisi.dart';
import 'package:module_televisi/domain/usecases/get_popular_televisi.dart';
import 'package:module_televisi/domain/usecases/get_televisi_detail.dart';
import 'package:module_televisi/domain/usecases/get_televisi_recommendations.dart';
import 'package:module_televisi/domain/usecases/get_top_rated_televisi.dart';
import 'package:module_televisi/domain/usecases/get_watchlist_status_televisi.dart';
import 'package:module_televisi/domain/usecases/get_watchlist_televisi.dart';
import 'package:module_televisi/domain/usecases/remove_watchlist_televisi.dart';
import 'package:module_televisi/domain/usecases/save_watchlist_televisi.dart';
import 'package:module_televisi/domain/usecases/search_televisi.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import 'televisi_bloc_test.mocks.dart';

@GenerateMocks([
  GetNowPlayingTelevisi,
  GetPopularTelevisi,
  GetTopRatedTelevisi,
  GetTelevisiRecommendations,
  SearchTelevisi,
  GetTelevisiDetail,
  GetWatchlistTelevisi,
  GetWatchListStatusTelevisi,
  SaveWatchlistTelevisi,
  RemoveWatchlistTelevisi,
])
void main() {
  // Now Playing Televisi
  late NowPlayingTelevisiBloc nowPlayingTelevisi;
  late MockGetNowPlayingTelevisi mockGetNowPlayingTelevisi;

  // Popular Televisi
  late PopularTelevisiBloc popularTelevisi;
  late MockGetPopularTelevisi mockGetPopularTelevisi;

  // Top Rated Televisi
  late TopRatedTelevisiBloc topRatedTelevisi;
  late MockGetTopRatedTelevisi mockGetTopRatedTelevisi;

  // Search Televisi
  late SearchTelevisiBloc searchTelevisi;
  late MockSearchTelevisi mockSearchTelevisi;

  // Recommendation Televisi
  late RecommendationsTelevisiBloc recommendationsTelevisi;
  late MockGetTelevisiRecommendations mockGetTelevisiRecommendations;

  // Detail Televisi
  late DetailTelevisiBloc detailTelevisiBloc;
  late MockGetTelevisiDetail mockGetTelevisiDetail;

  // Watchlist Televisi
  late WatchlistTelevisiBloc watchlistTelevisi;
  late MockGetWatchlistTelevisi mockGetWatchlistTelevisi;
  late MockGetWatchListStatusTelevisi mockGetWatchListStatusTelevisi;
  late MockSaveWatchlistTelevisi mockSaveWatchlistTelevisi;
  late MockRemoveWatchlistTelevisi mockRemoveWatchlistTelevisi;

  setUp(() {
    // On The Air Televisi
    mockGetNowPlayingTelevisi = MockGetNowPlayingTelevisi();
    nowPlayingTelevisi = NowPlayingTelevisiBloc(mockGetNowPlayingTelevisi);

    // Popular Televisi
    mockGetPopularTelevisi = MockGetPopularTelevisi();
    popularTelevisi = PopularTelevisiBloc(mockGetPopularTelevisi);

    // Top Rated Televisi
    mockGetTopRatedTelevisi = MockGetTopRatedTelevisi();
    topRatedTelevisi = TopRatedTelevisiBloc(mockGetTopRatedTelevisi);

    // Search Televisi
    mockSearchTelevisi = MockSearchTelevisi();
    searchTelevisi = SearchTelevisiBloc(mockSearchTelevisi);

    // Recommendation Televisi
    mockGetTelevisiRecommendations = MockGetTelevisiRecommendations();
    recommendationsTelevisi = RecommendationsTelevisiBloc(mockGetTelevisiRecommendations);

    // Detail Televisi
    mockGetTelevisiDetail = MockGetTelevisiDetail();
    detailTelevisiBloc = DetailTelevisiBloc(mockGetTelevisiDetail);

    // Watchlist Televisi
    mockGetWatchlistTelevisi = MockGetWatchlistTelevisi();
    mockSaveWatchlistTelevisi = MockSaveWatchlistTelevisi();
    mockRemoveWatchlistTelevisi = MockRemoveWatchlistTelevisi();
    mockGetWatchListStatusTelevisi = MockGetWatchListStatusTelevisi();
    watchlistTelevisi = WatchlistTelevisiBloc(
      mockGetWatchlistTelevisi,
      mockGetWatchListStatusTelevisi,
      mockSaveWatchlistTelevisi,
      mockRemoveWatchlistTelevisi,
    );
  });

  final tTelevisi = Televisi(
    backdropPath: '/nVKaObLEsiPyqfmrPXW4BW1MT3n.jpg',
    firstAirDate: DateTime.parse('1967-09-09'),
    genreIds: const [10762, 16, 10759],
    id: 1482,
    name: 'Spider-Man',
    originCountry: const ['CA', 'US'],
    originalLanguage: 'en',
    originalName: 'Spider-Man',
    overview:
    'Spider-Man is an animated television series that ran from September 9, 1967 to June 14, 1970. It was jointly produced in Canada and the United States and was the first animated adaptation of the Spider-Man comic book series, created by writer Stan Lee and artist Steve Ditko. It first aired on the ABC television network in the United States but went into syndication at the start of the third season. Grantray-Lawrence Animation produced the first season. Seasons 2 and 3 were crafted by producer Ralph Bakshi in New York City. In Canada, it is currently airing on Teletoon Retro. An internet meme, commonly known as 1960s Spiderman, regarding the series has received an overwhelming amount of popularity. The meme consists of a screenshot taken at a random part of the series and adding an inappropriate and/or witty text. Since the death of Max Ferguson on March 7 2013, there are only three surviving members from the cast. Those three being Paul Soles the voice of Spider-Man, Chris Wiggins the voice of Mysterio and Carl Banas the voice of the Scorpion.',
    popularity: 19.348,
    posterPath: '/n6eMF2lPQxiGmh2D612R5Tuxbzm.jpg',
    voteAverage: 7.8,
    voteCount: 162,
  );

  final tTelevisiList = [tTelevisi];
  const tQuery = 'spiderman';
  const tId = 1482;

  group("Get Now Playing Televisi", () {
    test("initial state should be Loading", () {
      expect(nowPlayingTelevisi.state, TelevisiLoading());
    });

    blocTest<NowPlayingTelevisiBloc, TelevisiState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockGetNowPlayingTelevisi.execute())
            .thenAnswer((_) async => Right(tTelevisiList));
        return nowPlayingTelevisi;
      },
      act: (bloc) => bloc.add(NowPlayingTelevisi()),
      expect: () => [
        TelevisiLoading(),
        TelevisiHasData(tTelevisiList),
      ],
      verify: (bloc) => verify(mockGetNowPlayingTelevisi.execute()),
    );

    blocTest<NowPlayingTelevisiBloc, TelevisiState>(
      "Should emit [Loading, Error] when get tv series is unsuccessful",
      build: () {
        when(mockGetNowPlayingTelevisi.execute())
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return nowPlayingTelevisi;
      },
      act: (bloc) => bloc.add(NowPlayingTelevisi()),
      expect: () => [
        TelevisiLoading(),
        const TelevisiError("Server Failure"),
      ],
      verify: (bloc) => verify(mockGetNowPlayingTelevisi.execute()),
    );
  });

  group("Get Popular Televisi", () {
    test("initial state should be Loading", () {
      expect(popularTelevisi.state, TelevisiLoading());
    });
    blocTest<PopularTelevisiBloc, TelevisiState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockGetPopularTelevisi.execute())
            .thenAnswer((_) async => Right(tTelevisiList));
        return popularTelevisi;
      },
      act: (bloc) => bloc.add(OnPopularTelevisi()),
      expect: () => [
        TelevisiLoading(),
        TelevisiHasData(tTelevisiList),
      ],
      verify: (bloc) => verify(mockGetPopularTelevisi.execute()),
    );

    blocTest<PopularTelevisiBloc, TelevisiState>(
      "Should emit [Loading, Error] when get televisi is unsuccessful",
      build: () {
        when(mockGetPopularTelevisi.execute())
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return popularTelevisi;
      },
      act: (bloc) => bloc.add(OnPopularTelevisi()),
      expect: () => [
        TelevisiLoading(),
        const TelevisiError("Server Failure"),
      ],
      verify: (bloc) => verify(mockGetPopularTelevisi.execute()),
    );
  });

  group("Get Top Rated Televisi", () {
    test("initial state should be Loading", () {
      expect(topRatedTelevisi.state, TelevisiLoading());
    });

    blocTest<TopRatedTelevisiBloc, TelevisiState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockGetTopRatedTelevisi.execute())
            .thenAnswer((_) async => Right(tTelevisiList));
        return topRatedTelevisi;
      },
      act: (bloc) => bloc.add(OnTopRatedTelevisi()),
      expect: () => [
        TelevisiLoading(),
        TelevisiHasData(tTelevisiList),
      ],
      verify: (bloc) => verify(mockGetTopRatedTelevisi.execute()),
    );

    blocTest<TopRatedTelevisiBloc, TelevisiState>(
      "Should emit [Loading, Error] when get televisi is unsuccessful",
      build: () {
        when(mockGetTopRatedTelevisi.execute())
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return topRatedTelevisi;
      },
      act: (bloc) => bloc.add(OnTopRatedTelevisi()),
      expect: () => [
        TelevisiLoading(),
        const TelevisiError("Server Failure"),
      ],
      verify: (bloc) => verify(mockGetTopRatedTelevisi.execute()),
    );
  });

  group("Search Televisi", () {
    test("initial state should be Loading", () {
      expect(searchTelevisi.state, TelevisiLoading());
    });

    blocTest<SearchTelevisiBloc, TelevisiState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockSearchTelevisi.execute(tQuery))
            .thenAnswer((_) async => Right(tTelevisiList));
        return searchTelevisi;
      },
      act: (bloc) => bloc.add(const OnQueryChangedTelevisi(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TelevisiLoading(),
        TelevisiSearchHasData(tTelevisiList),
      ],
      verify: (bloc) => verify(mockSearchTelevisi.execute(tQuery)),
    );

    blocTest<SearchTelevisiBloc, TelevisiState>(
      "Should emit [Loading, Error] when get televisi is unsuccessful",
      build: () {
        when(mockSearchTelevisi.execute(tQuery))
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return searchTelevisi;
      },
      act: (bloc) => bloc.add(const OnQueryChangedTelevisi(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TelevisiLoading(),
        const TelevisiError("Server Failure"),
      ],
      verify: (bloc) => verify(mockSearchTelevisi.execute(tQuery)),
    );
  });

  group(
    "Get Televisi Recommendation",
        () {
      test("initial state should be Loading", () {
        expect(recommendationsTelevisi.state, TelevisiLoading());
      });

      blocTest<RecommendationsTelevisiBloc, TelevisiState>(
        "Should emit [Loading, HasData] when data is gotten successfully",
        build: () {
          when(mockGetTelevisiRecommendations.execute(tId))
              .thenAnswer((_) async => Right(tTelevisiList));
          return recommendationsTelevisi;
        },
        act: (bloc) => bloc.add(const OnRecommendationTelevisi(tId)),
        expect: () => [
          TelevisiLoading(),
          TelevisiHasData(tTelevisiList),
        ],
        verify: (bloc) => verify(mockGetTelevisiRecommendations.execute(tId)),
      );

      blocTest<RecommendationsTelevisiBloc, TelevisiState>(
        "Should emit [Loading, Error] when get televisi is unsuccessful",
        build: () {
          when(mockGetTelevisiRecommendations.execute(tId))
              .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
          return recommendationsTelevisi;
        },
        act: (bloc) => bloc.add(const OnRecommendationTelevisi(tId)),
        expect: () => [
          TelevisiLoading(),
          const TelevisiError("Server Failure"),
        ],
        verify: (bloc) => verify(mockGetTelevisiRecommendations.execute(tId)),
      );
    },
  );

  group("Get Detail Televisi", () {
    test("initial state should be Loading", () {
      expect(detailTelevisiBloc.state, TelevisiLoading());
    });

    blocTest<DetailTelevisiBloc, TelevisiState>(
      "Should emit [Loading, HasData] when data is gotten successfully",
      build: () {
        when(mockGetTelevisiDetail.execute(tId))
            .thenAnswer((_) async => Right(testTelevisiDetail));
        return detailTelevisiBloc;
      },
      act: (bloc) => bloc.add(const OnDetailTelevisi(tId)),
      expect: () => [
        TelevisiLoading(),
        TelevisiDetailHasData(testTelevisiDetail),
      ],
      verify: (bloc) => verify(mockGetTelevisiDetail.execute(tId)),
    );

    blocTest<DetailTelevisiBloc, TelevisiState>(
      "Should emit [Loading, Error] when get detail series is unsuccessful",
      build: () {
        when(mockGetTelevisiDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
        return detailTelevisiBloc;
      },
      act: (bloc) => bloc.add(const OnDetailTelevisi(tId)),
      expect: () => [
        TelevisiLoading(),
        const TelevisiError("Server Failure"),
      ],
      verify: (bloc) => verify(mockGetTelevisiDetail.execute(tId)),
    );
  });

  group("Watchlist Televisi", () {
    test("initial state should be Loading", () {
      expect(watchlistTelevisi.state, TelevisiEmpty());
    });

    group("Get Watchlist Televisi", () {
      blocTest<WatchlistTelevisiBloc, TelevisiState>(
        "Should emit [Loading, HasData] when data is gotten successfully",
        build: () {
          when(mockGetWatchlistTelevisi.execute())
              .thenAnswer((_) async => Right(tTelevisiList));
          return watchlistTelevisi;
        },
        act: (bloc) => bloc.add(OnWatchlistTelevisi()),
        expect: () => [
          TelevisiLoading(),
          TelevisiWatchlistHasData(tTelevisiList),
        ],
        verify: (bloc) => verify(mockGetWatchlistTelevisi.execute()),
      );

      blocTest<WatchlistTelevisiBloc, TelevisiState>(
        "Should emit [Loading, Error] when get detail series is unsuccessful",
        build: () {
          when(mockGetWatchlistTelevisi.execute())
              .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
          return watchlistTelevisi;
        },
        act: (bloc) => bloc.add(OnWatchlistTelevisi()),
        expect: () => [
          TelevisiLoading(),
          const TelevisiError("Server Failure"),
        ],
        verify: (bloc) => verify(mockGetWatchlistTelevisi.execute()),
      );
    });

    group(
      "Get Watchlist Televisi Status",
          () {
        blocTest<WatchlistTelevisiBloc, TelevisiState>(
          "Should emit [Loading, HasData] when data is gotten successfully",
          build: () {
            when(mockGetWatchListStatusTelevisi.execute(tId))
                .thenAnswer((realInvocation) async => true);
            return watchlistTelevisi;
          },
          act: (bloc) => bloc.add(const OnLoadWatchlistStatusTelevisi(tId)),
          expect: () => [
            TelevisiLoading(),
            const TelevisiWatchlistLoadData(true),
          ],
          verify: (bloc) => verify(mockGetWatchListStatusTelevisi.execute(tId)),
        );

        blocTest<WatchlistTelevisiBloc, TelevisiState>(
          "Should emit [Loading, Error] when get detail series is unsuccessful",
          build: () {
            when(mockGetWatchListStatusTelevisi.execute(tId))
                .thenAnswer((realInvocation) async => false);
            return watchlistTelevisi;
          },
          act: (bloc) => bloc.add(const OnLoadWatchlistStatusTelevisi(tId)),
          expect: () => [
            TelevisiLoading(),
            const TelevisiWatchlistLoadData(false),
          ],
          verify: (bloc) => verify(mockGetWatchListStatusTelevisi.execute(tId)),
        );
      },
    );

    group("Save Watch List Televisi", () {
      blocTest<WatchlistTelevisiBloc,TelevisiState>(
        "Should emit [Loading, HasData] when data is gotten successfully",
        build: () {
          when(mockSaveWatchlistTelevisi.execute(testTelevisiDetail))
              .thenAnswer((_) async =>
          const Right(WatchlistTelevisiBloc.messageAddedToWatchlist));
          return watchlistTelevisi;
        },
        act: (bloc) => bloc.add(OnSaveWatchlistTelevisi(testTelevisiDetail)),
        expect: () => [
          TelevisiLoading(),
          const TelevisiWatchlistMessage(
              WatchlistTelevisiBloc.messageAddedToWatchlist)
        ],
        verify: (bloc) =>
            verify(mockSaveWatchlistTelevisi.execute(testTelevisiDetail)),
      );

      blocTest<WatchlistTelevisiBloc, TelevisiState>(
        "Should emit [Loading, Error] when get detail series is unsuccessful",
        build: () {
          when(mockSaveWatchlistTelevisi.execute(testTelevisiDetail))
              .thenAnswer((_) async => Left(ServerFailure("Server Failure")));
          return watchlistTelevisi;
        },
        act: (bloc) => bloc.add(OnSaveWatchlistTelevisi(testTelevisiDetail)),
        expect: () => [
          TelevisiLoading(),
          const TelevisiError("Server Failure"),
        ],
        verify: (bloc) =>
            verify(mockSaveWatchlistTelevisi.execute(testTelevisiDetail)),
      );
    });

    group("Remove  Watch List Televisi", () {
      blocTest<WatchlistTelevisiBloc, TelevisiState>(
        "Should emit [Loading, HasData] when data is gotten successfully",
        build: () {
          when(mockRemoveWatchlistTelevisi.execute(testTelevisiDetail))
              .thenAnswer((_) async =>
          const Right(WatchlistTelevisiBloc.messageRemoveToWatchlist));
          return watchlistTelevisi;
        },
        act: (bloc) => bloc.add(OnRemoveWatchlistTelevisi(testTelevisiDetail)),
        expect: () => [
          TelevisiLoading(),
          const TelevisiWatchlistMessage(
              WatchlistTelevisiBloc.messageRemoveToWatchlist)
        ],
        verify: (bloc) =>
            verify(mockRemoveWatchlistTelevisi.execute(testTelevisiDetail)),
      );

      blocTest<WatchlistTelevisiBloc, TelevisiState>(
        "Should emit [Loading, Error] when get detail series is unsuccessful",
        build: () {
          when(mockRemoveWatchlistTelevisi.execute(testTelevisiDetail))
              .thenAnswer((_) async => left(ServerFailure("Server Failure")));
          return watchlistTelevisi;
        },
        act: (bloc) => bloc.add(OnRemoveWatchlistTelevisi(testTelevisiDetail)),
        expect: () => [
          TelevisiLoading(),
          const TelevisiError("Server Failure"),
        ],
        verify: (bloc) =>
            verify(mockRemoveWatchlistTelevisi.execute(testTelevisiDetail)),
      );
    });
  });
}
