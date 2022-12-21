import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/pages/top_rated_televisi_page.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_bloc_helper.dart';

void main() {
  late TopRatedTelevisiBlocHelper topRatedTvBlocHelper;

  setUp(() {
    registerFallbackValue(TopRatedTelevisiStateHelper());
    registerFallbackValue(TopRatedTelevisiEventHelper());
    topRatedTvBlocHelper = TopRatedTelevisiBlocHelper();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTelevisiBloc>(
      create: (_) => topRatedTvBlocHelper,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  tearDown(() {
    topRatedTvBlocHelper.close();
  });

  testWidgets(
    'Page should display center progress bar when loading',
    ((WidgetTester widgetTester) async {
      when(() => topRatedTvBlocHelper.state).thenReturn(TelevisiLoading());

      final circularProgressIndicator = find.byType(CircularProgressIndicator);

      await widgetTester.pumpWidget(
        _makeTestableWidget(const TopRatedTelevisiPage()),
      );

      expect(circularProgressIndicator, findsOneWidget);
    }),
  );

  testWidgets(
    'Page should display ListView when data is loaded',
    ((WidgetTester widgetTester) async {
      when(() => topRatedTvBlocHelper.state).thenReturn(TelevisiLoading());
      when(() => topRatedTvBlocHelper.state)
          .thenReturn(TelevisiHasData(testTelevisiList));

      final listview = find.byType(ListView);

      await widgetTester.pumpWidget(
        _makeTestableWidget(const TopRatedTelevisiPage()),
      );

      expect(listview, findsOneWidget);
    }),
  );

  testWidgets(
    'Page should display text with message when Error',
    ((WidgetTester widgetTester) async {
      when(() => topRatedTvBlocHelper.state).thenReturn(TelevisiLoading());
      when(() => topRatedTvBlocHelper.state)
          .thenReturn(const TelevisiError("Error message"));

      final key = find.byKey(const Key("Error message"));

      await widgetTester.pumpWidget(
        _makeTestableWidget(const TopRatedTelevisiPage()),
      );

      expect(key, findsOneWidget);
    }),
  );
}