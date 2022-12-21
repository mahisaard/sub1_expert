import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_televisi/presentation/bloc/televisi_bloc.dart';
import 'package:module_televisi/presentation/widgets/televisi_card_list.dart';

class NowPlayingTelevisiPage extends StatefulWidget {
  static const ROUTE_NAME = '/nowplaying-televisi';

  const NowPlayingTelevisiPage({Key? key}) : super(key: key);

  @override
  State<NowPlayingTelevisiPage> createState() => _NowPlayingTelevisiPageState();
}

class _NowPlayingTelevisiPageState extends State<NowPlayingTelevisiPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        () => context.read<NowPlayingTelevisiBloc>().add(NowPlayingTelevisi()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing Televisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingTelevisiBloc, TelevisiState>(
          builder: (context, state) {
            if (state is TelevisiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TelevisiHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final televisi = state.televisi[index];
                  return TelevisiCard(televisi);
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