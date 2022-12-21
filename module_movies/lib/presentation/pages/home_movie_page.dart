import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_common/common/constants.dart';
import 'package:module_common/common_page/about_page.dart';
import 'package:module_movies/domain/entities/movie.dart';
import 'package:module_movies/presentation/bloc/movie_bloc.dart';
import 'package:module_movies/presentation/pages/movie_detail_page.dart';
import 'package:module_movies/presentation/pages/popular_movies_page.dart';
import 'package:module_movies/presentation/pages/search_page.dart';
import 'package:module_movies/presentation/pages/top_rated_movies_page.dart';
import 'package:module_movies/presentation/pages/watchlist_movies_page.dart';
import 'package:module_televisi/presentation/pages/home_televisi_page.dart';
import 'package:module_televisi/presentation/pages/watchlist_televisi_page.dart';


class HomeMoviePage extends StatefulWidget {
  static const ROUTE_NAME = '/home_movie';

  const HomeMoviePage({Key? key}) : super(key: key);
  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingMovieBloc>().add(OnNowPlayingMovie());
      context.read<PopularMovieBloc>().add(OnPopularMovie());
      context.read<TopRatedMovieBloc>().add(OnTopRatedMovie());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pop(context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv_outlined),
              title: Text('Televisi'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeTelevisiPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt_outlined),
              title: Text('Watchlist Televisi'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTelevisiPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              BlocBuilder<NowPlayingMovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieHasData) {
                    return MovieList(state.movies);
                  } else if (state is MovieError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text("Failed"));
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularMovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieHasData) {
                    return MovieList(state.movies);
                  } else if (state is MovieError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text("Failed"));
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedMovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieHasData) {
                    return MovieList(state.movies);
                  } else if (state is MovieError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text("Failed"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
