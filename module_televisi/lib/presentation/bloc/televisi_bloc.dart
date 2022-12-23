import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entities/televisi.dart';
import '../../domain/entities/televisi_detail.dart';
import '../../domain/usecases/get_now_playing_televisi.dart';
import '../../domain/usecases/get_popular_televisi.dart';
import '../../domain/usecases/get_televisi_recommendations.dart';
import '../../domain/usecases/get_top_rated_televisi.dart';
import '../../domain/usecases/get_televisi_detail.dart';
import '../../domain/usecases/get_watchlist_status_televisi.dart';
import '../../domain/usecases/get_watchlist_televisi.dart';
import '../../domain/usecases/remove_watchlist_televisi.dart';
import '../../domain/usecases/save_watchlist_televisi.dart';
import '../../domain/usecases/search_televisi.dart';

part 'televisi_event.dart';
part 'televisi_state.dart';

// Televisi On The Air Bloc
class NowPlayingTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final GetNowPlayingTelevisi _nowPlayingTelevisi;
  NowPlayingTelevisiBloc(this._nowPlayingTelevisi) : super(TelevisiLoading()) {
    on<NowPlayingTelevisi>((event, emit) async {
      emit(TelevisiLoading());
      final result = await _nowPlayingTelevisi.execute();
      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (data) => emit(TelevisiHasData(data)),
      );
    });
  }
}

// Televisi Popular Bloc
class PopularTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final GetPopularTelevisi _popularTelevisi;
  PopularTelevisiBloc(this._popularTelevisi) : super(TelevisiLoading()) {
    on<OnPopularTelevisi>((event, emit) async {
      emit(TelevisiLoading());
      final result = await _popularTelevisi.execute();
      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (data) => emit(TelevisiHasData(data)),
      );
    });
  }
}

// Televisi Top Rated Bloc
class TopRatedTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final GetTopRatedTelevisi _topRatedTelevisi;

  TopRatedTelevisiBloc(this._topRatedTelevisi) : super(TelevisiLoading()) {
    on<OnTopRatedTelevisi>((event, emit) async {
      emit(TelevisiLoading());

      final result = await _topRatedTelevisi.execute();

      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (data) => emit(TelevisiHasData(data)),
      );
    });
  }
}

// Search TV Series Bloc
class SearchTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final SearchTelevisi _searchTelevisi;

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  SearchTelevisiBloc(this._searchTelevisi) : super(TelevisiLoading()) {
    on<OnQueryChangedTelevisi>(
      (event, emit) async {
        final query = event.query;
        emit(TelevisiLoading());
        final result = await _searchTelevisi.execute(query);
        result.fold(
          (failure) => emit(TelevisiError(failure.message)),
          (data) => emit(TelevisiSearchHasData(data)),
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

// Recommendation Tv Series Bloc
class RecommendationsTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final GetTelevisiRecommendations _televisiRecommendations;

  RecommendationsTelevisiBloc(this._televisiRecommendations)
      : super(TelevisiLoading()) {
    on<OnRecommendationTelevisi>((event, emit) async {
      final int id = event.id;
      emit(TelevisiLoading());
      final result = await _televisiRecommendations.execute(id);

      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (data) => emit(TelevisiHasData(data)),
      );
    });
  }
}

// Detail Tv Series Bloc
class DetailTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final GetTelevisiDetail _televisiDetail;

  DetailTelevisiBloc(this._televisiDetail) : super(TelevisiLoading()) {
    on<OnDetailTelevisi>((event, emit) async {
      final int id = event.id;

      emit(TelevisiLoading());

      final result = await _televisiDetail.execute(id);

      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (data) => emit(TelevisiDetailHasData(data)),
      );
    });
  }
}

// Watchlist Tv Series Bloc
class WatchlistTelevisiBloc extends Bloc<TelevisiEvent, TelevisiState> {
  final GetWatchlistTelevisi _watchlistTelevisi;
  final GetWatchListStatusTelevisi _watchListStatusTelevisi;
  final SaveWatchlistTelevisi _saveWatchlistTelevisi;
  final RemoveWatchlistTelevisi _removeWatchlistTelevisi;

  static const messageAddedToWatchlist = "Added to Watchlist";
  static const messageRemoveToWatchlist = "Removed from Watchlist";

  WatchlistTelevisiBloc(
    this._watchlistTelevisi,
    this._watchListStatusTelevisi,
    this._saveWatchlistTelevisi,
    this._removeWatchlistTelevisi,
  ) : super(TelevisiEmpty()) {
    // Watchlist Televisi
    on<OnWatchlistTelevisi>((event, emit) async {
      emit(TelevisiLoading());
      final result = await _watchlistTelevisi.execute();

      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (data) => emit(TelevisiWatchlistHasData(data)),
      );
    });

    // Wacthlist Status Televisi
    on<OnLoadWatchlistStatusTelevisi>((event, emit) async {
      final int id = event.id;

      emit(TelevisiLoading());

      final result = await _watchListStatusTelevisi.execute(id);
      emit(TelevisiWatchlistLoadData(result));
    });

    // Save Watchlist Tv Series
    on<OnSaveWatchlistTelevisi>((event, emit) async {
      final televisi = event.televisi;
      emit(TelevisiLoading());

      final result = await _saveWatchlistTelevisi.execute(televisi);

      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (message) => emit(TelevisiWatchlistMessage(message)),
      );
    });

    on<OnRemoveWatchlistTelevisi>((event, emit) async {
      final televisi = event.televisi;
      emit(TelevisiLoading());
      final result = await _removeWatchlistTelevisi.execute(televisi);
      result.fold(
        (failure) => emit(TelevisiError(failure.message)),
        (message) => emit(TelevisiWatchlistMessage(message)),
      );
    });
  }
}
