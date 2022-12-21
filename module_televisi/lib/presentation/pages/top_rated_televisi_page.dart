import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/widgets/televisi_card_list.dart';

class TopRatedTelevisiPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-televisi';

  const TopRatedTelevisiPage({Key? key}) : super(key: key);

  @override
  State<TopRatedTelevisiPage> createState() => _TopRatedTelevisiPageState();
}

class _TopRatedTelevisiPageState extends State<TopRatedTelevisiPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TopRatedTelevisiBloc>().add(OnTopRatedTelevisi()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Televisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTelevisiBloc, TelevisiState>(
          builder: (context, state) {
            if (state is TelevisiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TelevisiHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvseries = state.televisi[index];
                  return TelevisiCard(tvseries);
                },
                itemCount: state.televisi.length,
              );
            } else if (state is TelevisiError) {
              return Center(
                key: const Key("Error message"),
                child: Text(state.message),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
