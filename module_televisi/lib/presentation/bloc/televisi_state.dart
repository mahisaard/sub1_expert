part of 'televisi_bloc.dart';

abstract class TelevisiState extends Equatable {
  const TelevisiState();

  @override
  List<Object> get props => [];
}

// Televisi State Empty
class TelevisiEmpty extends TelevisiState {}

// Televisi State Loading
class TelevisiLoading extends TelevisiState {}

// Televisi State Error
class TelevisiError extends TelevisiState {
  final String message;

  const TelevisiError(this.message);

  @override
  List<Object> get props => [message];
}

// Televisi State HasData
class TelevisiHasData extends TelevisiState {
  final List<Televisi> televisi;

  const TelevisiHasData(this.televisi);

  @override
  List<Object> get props => [televisi];
}

// Televisi Detail State HasData
class TelevisiDetailHasData extends TelevisiState {
  final TelevisiDetail televisiDetail;

  const TelevisiDetailHasData(this.televisiDetail);

  @override
  List<Object> get props => [televisiDetail];
}

// Televisi Search State
class TelevisiSearchHasData extends TelevisiState {
  final List<Televisi> result;

  const TelevisiSearchHasData(this.result);

  @override
  List<Object> get props => [result];
}

// Televisi Watchlist HasData
class TelevisiWatchlistHasData extends TelevisiState {
  final List<Televisi> watchlist;

  const TelevisiWatchlistHasData(this.watchlist);

  @override
  List<Object> get props => [watchlist];
}

// Televisi Watchlist Message
class TelevisiWatchlistMessage extends TelevisiState {
  final String message;

  const TelevisiWatchlistMessage(this.message);

  @override
  List<Object> get props => [message];
}

// Televisi Load Data Watchlist
class TelevisiWatchlistLoadData extends TelevisiState {
  final bool isWatchlist;

  const TelevisiWatchlistLoadData(this.isWatchlist);

  @override
  List<Object> get props => [isWatchlist];
}
