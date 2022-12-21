import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/pages/televisi_detail_page.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_bloc_helper.dart';

void main() {
  late RecommendationsTelevisiBlocHelper recommendationsTelevisiBlocHelper;
  late DetailTelevisiBlocHelper detailTelevisiBlocHelper;
  late WatchlistTelevisiBlocHelper watchlistTelevisiBlocHelper;

  setUpAll(() {
    // Recommendation Televisi
    registerFallbackValue(RecommendationsTelevisiStateHelper());
    registerFallbackValue(RecommendationsTelevisiEventHelper());
    recommendationsTelevisiBlocHelper = RecommendationsTelevisiBlocHelper();

    // Detail Televisi
    registerFallbackValue(DetailTelevisiStateHelper());
    registerFallbackValue(DetailTelevisiEventHelper());
    detailTelevisiBlocHelper = DetailTelevisiBlocHelper();

    // WatchList Televisi
    registerFallbackValue(WatchlistTelevisiStateHelper());
    registerFallbackValue(WatchlistTelevisiEventHelper());
    watchlistTelevisiBlocHelper = WatchlistTelevisiBlocHelper();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        BlocProvider<RecommendationsTelevisiBloc>(
          create: (_) => recommendationsTelevisiBlocHelper,
        ),
        BlocProvider<DetailTelevisiBloc>(
          create: (_) => detailTelevisiBlocHelper,
        ),
        BlocProvider<WatchlistTelevisiBloc>(
          create: (_) => watchlistTelevisiBlocHelper,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'Page should display center progress bar when loading',
    ((WidgetTester widgetTester) async {
      when(() => detailTelevisiBlocHelper.state).thenReturn(TelevisiLoading());
      when(() => recommendationsTelevisiBlocHelper.state)
          .thenReturn(TelevisiLoading());
      when(() => watchlistTelevisiBlocHelper.state).thenReturn(TelevisiLoading());

      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await widgetTester.pumpWidget(
        _makeTestableWidget(
          const TelevisiDetailPage(
            id: 1,
          ),
        ),
      );

      await widgetTester.pump();

      expect(circularProgressIndicator, findsOneWidget);
    }),
  );

  testWidgets(
    'Watchlist button should display add icon when tv added to watch list',
    ((WidgetTester widgetTester) async {
      when(() => detailTelevisiBlocHelper.state).thenReturn(
        TelevisiDetailHasData(testTelevisiDetail),
      );
      when(() => recommendationsTelevisiBlocHelper.state).thenReturn(
        TelevisiDetailHasData(testTelevisiDetail),
      );
      when(() => watchlistTelevisiBlocHelper.state).thenReturn(
        const TelevisiWatchlistLoadData(false),
      );

      final watchListButtonIcon = find.byIcon(Icons.add);

      await widgetTester.pumpWidget(
        _makeTestableWidget(
          const TelevisiDetailPage(
            id: 1,
          ),
        ),
      );

      await widgetTester.pump();

      expect(watchListButtonIcon, findsOneWidget);
    }),
  );

  testWidgets(
    'Watchlist button should display check icon when movie added to watch list',
    ((WidgetTester widgetTester) async {
      when(() => detailTelevisiBlocHelper.state).thenReturn(
        TelevisiDetailHasData(testTelevisiDetail),
      );
      when(() => recommendationsTelevisiBlocHelper.state).thenReturn(
        TelevisiDetailHasData(testTelevisiDetail),
      );
      when(() => watchlistTelevisiBlocHelper.state).thenReturn(
        const TelevisiWatchlistLoadData(true),
      );

      final watchListButtonIcon = find.byIcon(Icons.check);

      await widgetTester.pumpWidget(
        _makeTestableWidget(
          const TelevisiDetailPage(
            id: 1,
          ),
        ),
      );

      await widgetTester.pump();

      expect(watchListButtonIcon, findsOneWidget);
    }),
  );
}
