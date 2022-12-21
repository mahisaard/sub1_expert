import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';

// Now Playing Televisi
class NowPlayingTelevisiStateHelper extends Fake implements TelevisiState {}

class NowPlayingTelevisiEventHelper extends Fake implements TelevisiState {}

class NowPlayingTelevisiBlocHelper extends MockBloc<TelevisiEvent, TelevisiState>
    implements NowPlayingTelevisiBloc {}

// Popular Televisi
class PopularTelevisiStateHelper extends Fake implements TelevisiState {}

class PopularTelevisiEventHelper extends Fake implements TelevisiState {}

class PopularTelevisiBlocHelper extends MockBloc<TelevisiEvent, TelevisiState>
    implements PopularTelevisiBloc {}

// Top Rated Televisi
class TopRatedTelevisiStateHelper extends Fake implements TelevisiState {}

class TopRatedTelevisiEventHelper extends Fake implements TelevisiState {}

class TopRatedTelevisiBlocHelper extends MockBloc<TelevisiEvent, TelevisiState>
    implements TopRatedTelevisiBloc {}

// Detail Televisi
class DetailTelevisiStateHelper extends Fake implements TelevisiState {}

class DetailTelevisiEventHelper extends Fake implements TelevisiState {}

class DetailTelevisiBlocHelper extends MockBloc<TelevisiEvent, TelevisiState>
    implements DetailTelevisiBloc {}

// Recommendations Televisi
class RecommendationsTelevisiStateHelper extends Fake implements TelevisiState {}

class RecommendationsTelevisiEventHelper extends Fake implements TelevisiState {}

class RecommendationsTelevisiBlocHelper extends MockBloc<TelevisiEvent, TelevisiState>
    implements RecommendationsTelevisiBloc {}

// Watch List Televisi
class WatchlistTelevisiStateHelper extends Fake implements TelevisiState {}

class WatchlistTelevisiEventHelper extends Fake implements TelevisiState {}

class WatchlistTelevisiBlocHelper extends MockBloc<TelevisiEvent, TelevisiState>
    implements WatchlistTelevisiBloc {}
