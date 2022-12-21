part of 'televisi_bloc.dart';

abstract class TelevisiEvent extends Equatable {
  const TelevisiEvent();

  @override
  List<Object> get props => [];
}

// On The Air Event
class NowPlayingTelevisi extends TelevisiEvent {}

// Popular Event
class OnPopularTelevisi extends TelevisiEvent {}

// Top Rated Event
class OnTopRatedTelevisi extends TelevisiEvent {}

// Search Event
class OnQueryChangedTelevisi extends TelevisiEvent {
  final String query;

  const OnQueryChangedTelevisi(this.query);

  @override
  List<Object> get props => [query];
}

// Recommendation Event
class OnRecommendationTelevisi extends TelevisiEvent {
  final int id;

  const OnRecommendationTelevisi(this.id);

  @override
  List<Object> get props => [id];
}

// Detail Event
class OnDetailTelevisi extends TelevisiEvent {
  final int id;

  const OnDetailTelevisi(this.id);

  @override
  List<Object> get props => [id];
}

// Watchlist Event
class OnWatchlistTelevisi extends TelevisiEvent {}

// Save Watchlist televisi Event
class OnSaveWatchlistTelevisi extends TelevisiEvent {
  final TelevisiDetail televisi;

  const OnSaveWatchlistTelevisi(this.televisi);

  @override
  List<Object> get props => [televisi];
}

// Remove Watchlist televisi Event
class OnRemoveWatchlistTelevisi extends TelevisiEvent {
  final TelevisiDetail televisi;

  const OnRemoveWatchlistTelevisi(this.televisi);

  @override
  List<Object> get props => [televisi];
}

// Load Watchlist Televisi Event
class OnLoadWatchlistStatusTelevisi extends TelevisiEvent {
  final int id;

  const OnLoadWatchlistStatusTelevisi(this.id);

  @override
  List<Object> get props => [id];
}
