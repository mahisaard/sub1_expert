import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_common/common/constants.dart';
import 'package:module_televisi/domain/entities/genre_televisi.dart';
import 'package:module_televisi/domain/entities/televisi.dart';
import 'package:module_televisi/domain/entities/televisi_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';

class TelevisiDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-televissi';

  final int id;

  const TelevisiDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<TelevisiDetailPage> createState() => _TelevisiDetailPageState();
}

class _TelevisiDetailPageState extends State<TelevisiDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailTelevisiBloc>().add(OnDetailTelevisi(widget.id));
      context.read<RecommendationsTelevisiBloc>().add(
            OnRecommendationTelevisi(widget.id),
          );
      context.read<WatchlistTelevisiBloc>().add(
            OnLoadWatchlistStatusTelevisi(widget.id),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final televisiRecommendation =
        context.select<RecommendationsTelevisiBloc, List<Televisi>>((value) {
      var state = value.state;
      if (state is TelevisiHasData) {
        return (state).televisi;
      }
      return [];
    });

    var isAddedToWatchlist =
        context.select<WatchlistTelevisiBloc, bool>((value) {
      var state = value.state;
      if (state is TelevisiWatchlistLoadData) {
        return state.isWatchlist;
      }
      return false;
    });

    return Scaffold(
      body: BlocBuilder<DetailTelevisiBloc, TelevisiState>(
        builder: (context, state) {
          if (state is TelevisiLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TelevisiDetailHasData) {
            return SafeArea(
              child: DetailContent(
                state.televisiDetail,
                televisiRecommendation,
                isAddedToWatchlist,
              ),
            );
          } else if (state is TelevisiError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Failed'),
            );
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TelevisiDetail televisi;
  final List<Televisi> recommendations;
  final bool isAddedWatchlistTelevisi;

  const DetailContent(
      this.televisi, this.recommendations, this.isAddedWatchlistTelevisi,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${televisi.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              televisi.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (!isAddedWatchlistTelevisi) {
                                  context
                                      .read<WatchlistTelevisiBloc>()
                                      .add(OnSaveWatchlistTelevisi(televisi));
                                } else {
                                  context
                                      .read<WatchlistTelevisiBloc>()
                                      .add(OnRemoveWatchlistTelevisi(televisi));
                                }

                                String message = '';

                                final state =
                                    BlocProvider.of<WatchlistTelevisiBloc>(
                                            context)
                                        .state;

                                if (state is TelevisiWatchlistLoadData) {
                                  message = isAddedWatchlistTelevisi
                                      ? WatchlistTelevisiBloc
                                          .messageRemoveToWatchlist
                                      : WatchlistTelevisiBloc
                                          .messageAddedToWatchlist;
                                } else {
                                  message = isAddedWatchlistTelevisi == false
                                      ? WatchlistTelevisiBloc
                                          .messageAddedToWatchlist
                                      : WatchlistTelevisiBloc
                                          .messageRemoveToWatchlist;
                                }

                                if (message ==
                                        WatchlistTelevisiBloc
                                            .messageAddedToWatchlist ||
                                    message ==
                                        WatchlistTelevisiBloc
                                            .messageRemoveToWatchlist) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          content: Text(
                                            message,
                                          )));
                                  //LOAD NEW STATUS
                                  BlocProvider.of<WatchlistTelevisiBloc>(
                                          context)
                                      .add(OnLoadWatchlistStatusTelevisi(
                                          televisi.id));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(message),
                                        );
                                      });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlistTelevisi
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(televisi.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: televisi.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${televisi.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              televisi.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final tvSeries = recommendations[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          TelevisiDetailPage.ROUTE_NAME,
                                          arguments: tvSeries.id,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: recommendations.length,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<GenreTelevisi> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
