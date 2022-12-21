import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_movies/presentation/bloc/movie_bloc.dart';
import 'package:module_movies/presentation/widgets/movie_card_list.dart';

class NowPlayingMoviePage extends StatefulWidget {
  static const ROUTE_NAME = '/nowplaying-movie';

  const NowPlayingMoviePage({Key? key}) : super(key: key);

  @override
  State<NowPlayingMoviePage> createState() => _NowPlayingMoviePageState();
}

class _NowPlayingMoviePageState extends State<NowPlayingMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<NowPlayingMovieBloc>().add(OnNowPlayingMovie()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingMovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MovieHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final nowOnAiringTv = state.movies[index];
                  return MovieCard(nowOnAiringTv);
                },
                itemCount: state.movies.length,
              );
            } else if (state is MovieError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Text('No Movies :(');
            }
          },
        ),
      ),
    );
  }
}
