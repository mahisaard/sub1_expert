import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_common/common/utils.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/widgets/televisi_card_list.dart';

class WatchlistTelevisiPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-televisi';

  const WatchlistTelevisiPage({Key? key}) : super(key: key);

  @override
  State<WatchlistTelevisiPage> createState() => _WatchlistTelevisiPageState();
}

class _WatchlistTelevisiPageState extends State<WatchlistTelevisiPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchlistTelevisiBloc>().add(OnWatchlistTelevisi());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<WatchlistTelevisiBloc>().add(OnWatchlistTelevisi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist Televisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistTelevisiBloc, TelevisiState>(
          builder: (context, state) {
            if (state is TelevisiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TelevisiWatchlistHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final televisiData = state.watchlist[index];
                  return TelevisiCard(televisiData);
                },
                itemCount: state.watchlist.length,
              );
            } else if (state is TelevisiError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(
                child: Text("Failed"),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
