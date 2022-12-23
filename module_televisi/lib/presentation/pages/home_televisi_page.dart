import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_common/common/constants.dart';
import 'package:module_common/common_page/about_page.dart';
import 'package:module_movies/presentation/pages/watchlist_movies_page.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/pages/popular_televisi_page.dart';
import 'package:module_televisi/presentation/pages/search_televisi_page.dart';
import 'package:module_televisi/presentation/pages/sedang_tayang_tv_page.dart';
import 'package:module_televisi/presentation/pages/televisi_detail_page.dart';
import 'package:module_televisi/presentation/pages/top_rated_televisi_page.dart';
import 'package:module_televisi/presentation/pages/watchlist_televisi_page.dart';
import 'package:module_movies/presentation/pages/home_movie_page.dart';
import '../../domain/entities/televisi.dart';
import 'package:flutter/material.dart';

class HomeTelevisiPage extends StatefulWidget {
  static const ROUTE_NAME = '/home_televisi';

  const HomeTelevisiPage({Key? key}) : super(key: key);

  @override
  State<HomeTelevisiPage> createState() => _HomeTelevisiPageState();
}

class _HomeTelevisiPageState extends State<HomeTelevisiPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingTelevisiBloc>().add(NowPlayingTelevisi());
      context.read<PopularTelevisiBloc>().add(OnPopularTelevisi());
      context.read<TopRatedTelevisiBloc>().add(OnTopRatedTelevisi());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Movies'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv_outlined),
              title: const Text('Televisi'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt_outlined),
              title: const Text('Watchlist Televisi'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTelevisiPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        key: const Key("televisi page"),
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchTelevisiPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Now Playing',
                onTap: () => Navigator.pushNamed(
                    context, NowPlayingTelevisiPage.ROUTE_NAME),
              ),
              BlocBuilder<NowPlayingTelevisiBloc, TelevisiState>(
                builder: (context, state) {
                  if (state is TelevisiLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TelevisiHasData) {
                    return TelevisiList(state.televisi);
                  } else if (state is TelevisiError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('Failed'));
                  }
                },
              ),
              _buildSubHeading(
                title: 'Tayangan Populer',
                onTap: () => Navigator.pushNamed(
                    context, PopularTelevisiPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularTelevisiBloc, TelevisiState>(
                builder: (context, state) {
                  if (state is TelevisiLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TelevisiHasData) {
                    return TelevisiList(state.televisi);
                  } else if (state is TelevisiError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('Failed'));
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                    context, TopRatedTelevisiPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedTelevisiBloc, TelevisiState>(
                builder: (context, state) {
                  if (state is TelevisiLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TelevisiHasData) {
                    return TelevisiList(state.televisi);
                  } else if (state is TelevisiError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('Failed'));
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
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TelevisiList extends StatelessWidget {
  final List<Televisi> televisi;

  const TelevisiList(this.televisi, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = televisi[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TelevisiDetailPage.ROUTE_NAME,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: televisi.length,
      ),
    );
  }
}
