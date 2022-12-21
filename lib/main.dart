import 'package:ditonton/ssl/ssl_pinning_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_common/common/constants.dart';
import 'package:module_common/common/utils.dart';
import 'package:module_common/common_page/about_page.dart';
import 'package:module_movies/presentation/bloc/movie_bloc.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/pages/home_televisi_page.dart';
import 'package:module_televisi/presentation/pages/popular_televisi_page.dart';
import 'package:module_televisi/presentation/pages/search_televisi_page.dart';
import 'package:module_televisi/presentation/pages/sedang_tayang_tv_page.dart';
import 'package:module_televisi/presentation/pages/televisi_detail_page.dart';
import 'package:module_televisi/presentation/pages/top_rated_televisi_page.dart';
import 'package:module_televisi/presentation/pages/watchlist_televisi_page.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:module_movies/presentation/pages/home_movie_page.dart';
import 'package:module_movies/presentation/pages/movie_detail_page.dart';
import 'package:module_movies/presentation/pages/popular_movies_page.dart';
import 'package:module_movies/presentation/pages/search_page.dart';
import 'package:module_movies/presentation/pages/top_rated_movies_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SslPinningHelper.initializing();

  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // MOVIE BLOC
        BlocProvider(
          create: (_) => di.locator<NowPlayingMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),

        // TV SERIES BLOC
        BlocProvider(
          create: (_) => di.locator<NowPlayingTelevisiBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTelevisiBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTelevisiBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTelevisiBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationsTelevisiBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailTelevisiBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTelevisiBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
          // Movie Route
            case HomeMoviePage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => const HomeMoviePage(),
              );
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => const PopularMoviesPage(),
              );
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => const TopRatedMoviesPage(),
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(
                builder: (_) => const SearchPage(),
              );
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
          // TV Series Route
            case NowPlayingTelevisiPage.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const NowPlayingTelevisiPage());
            case HomeTelevisiPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomeTelevisiPage());
            case PopularTelevisiPage.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const PopularTelevisiPage());
            case TopRatedTelevisiPage.ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_) => const TopRatedTelevisiPage());
            case SearchTelevisiPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => const SearchTelevisiPage());
            case TelevisiDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TelevisiDetailPage(id: id),
                settings: settings,
              );
            case WatchlistTelevisiPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const WatchlistTelevisiPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}