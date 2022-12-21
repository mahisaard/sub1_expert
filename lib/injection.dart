import 'package:ditonton/ssl/ssl_pinning_helper.dart';
import 'package:module_movies/data/datasources/db/database_movie_helper.dart';
import 'package:module_movies/data/datasources/movie_local_data_source.dart';
import 'package:module_movies/data/datasources/movie_remote_data_source.dart';
import 'package:module_movies/data/repositories/movie_repository_impl.dart';
import 'package:module_movies/domain/repositories/movie_repository.dart';
import 'package:module_movies/domain/usecases/get_movie_detail.dart';
import 'package:module_movies/domain/usecases/get_movie_recommendations.dart';
import 'package:module_movies/domain/usecases/get_now_playing_movies.dart';
import 'package:module_movies/domain/usecases/get_popular_movies.dart';
import 'package:module_movies/domain/usecases/get_top_rated_movies.dart';
import 'package:module_movies/domain/usecases/get_watchlist_movies.dart';
import 'package:module_movies/domain/usecases/get_watchlist_status.dart';
import 'package:module_movies/domain/usecases/remove_watchlist.dart';
import 'package:module_movies/domain/usecases/save_watchlist.dart';
import 'package:module_movies/domain/usecases/search_movies.dart';
import 'package:module_movies/presentation/bloc/movie_bloc.dart';
import 'package:module_televisi/data/datasources/db/database_televisi_helper.dart';
import 'package:module_televisi/data/datasources/televisi_data_lokal_source.dart';
import 'package:module_televisi/data/datasources/televisi_data_remote_source.dart';
import 'package:module_televisi/data/repositories/televisi_repository_impl.dart';
import 'package:module_televisi/domain/repositories/televisi_repository.dart';
import 'package:module_televisi/domain/usecases/get_now_playing_televisi.dart';
import 'package:module_televisi/domain/usecases/get_popular_televisi.dart';
import 'package:module_televisi/domain/usecases/get_televisi_recommendations.dart';
import 'package:module_televisi/domain/usecases/get_top_rated_televisi.dart';
import 'package:module_televisi/domain/usecases/get_televisi_detail.dart';
import 'package:module_televisi/domain/usecases/get_watchlist_status_televisi.dart';
import 'package:module_televisi/domain/usecases/get_watchlist_televisi.dart';
import 'package:module_televisi/domain/usecases/remove_watchlist_televisi.dart';
import 'package:module_televisi/domain/usecases/save_watchlist_televisi.dart';
import 'package:module_televisi/domain/usecases/search_televisi.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // BLOC
  // Movie BLOC
  locator.registerFactory(() => NowPlayingMovieBloc(
    locator(),
  ));
  locator.registerFactory(() => PopularMovieBloc(
    locator(),
  ));
  locator.registerFactory(() => TopRatedMovieBloc(
    locator(),
  ));
  locator.registerFactory(() => SearchMovieBloc(
    locator(),
  ));
  locator.registerFactory(() => RecommendationsBloc(
    locator(),
  ));
  locator.registerFactory(() => DetailMovieBloc(
    locator(),
  ));
  locator.registerFactory(() => WatchlistMovieBloc(
    locator(),
    locator(),
    locator(),
    locator(),
  ));

  // Tv series BLOC
  locator.registerFactory(() => NowPlayingMovieBloc(
    locator(),
  ));
  locator.registerFactory(() => PopularTelevisiBloc(
    locator(),
  ));
  locator.registerFactory(() => TopRatedTelevisiBloc(
    locator(),
  ));
  locator.registerFactory(() => SearchTelevisiBloc(
    locator(),
  ));
  locator.registerFactory(() => RecommendationsTelevisiBloc(
    locator(),
  ));
  locator.registerFactory(() => DetailTelevisiBloc(
    locator(),
  ));
  locator.registerFactory(() => WatchlistTelevisiBloc(
    locator(),
    locator(),
    locator(),
    locator(),
  ));

  // USE CASE
  // Movie use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  // Tv series use case
  locator.registerLazySingleton(() => GetPopularTelevisi(locator()));
  locator.registerLazySingleton(() => GetNowPlayingTelevisi(locator()));
  locator.registerLazySingleton(() => GetTopRatedTelevisi(locator()));
  locator.registerLazySingleton(() => GetTelevisiDetail(locator()));
  locator.registerLazySingleton(() => GetTelevisiRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTelevisi(locator()));
  locator.registerLazySingleton(() => GetWatchlistTelevisi(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTelevisi(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTelevisi(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTelevisi(locator()));
  // repository
  // Movie repository
  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
    remoteDataSource: locator(),
    localDataSource: locator(),
  ));
  // Tv repository
  locator
      .registerLazySingleton<TelevisiRepository>(() => TelevisiRepositoryImpl(
    remoteDataSource: locator(),
    localDataSource: locator(),
  ));
  // data sources
  // Movie data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(
        client: locator(),
      ));
  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(
        databaseHelper: locator(),
      ));

  // Tv Series data sources
  locator.registerLazySingleton<TelevisiRemoteDataSource>(
          () => TelevisiRemoteDataSourceImpl(
        client: locator(),
      ));
  locator.registerLazySingleton<TelevisiDataLokalSource>(
          () => TelevisiDataLokalSourceImpl(
        databaseHelperTelevisi: locator(),
      ));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(
        () => DatabaseHelper(),
  );
  locator.registerLazySingleton<DatabaseHelperTelevisi>(
        () => DatabaseHelperTelevisi(),
  );

  // external
  locator.registerLazySingleton(() => SslPinningHelper.client);
}

