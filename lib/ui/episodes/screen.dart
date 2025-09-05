
import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/ui/blocs/episodes/bloc.dart';
import 'package:flutter_app_challenge/ui/blocs/episodes/events.dart';
import 'package:flutter_app_challenge/ui/blocs/episodes/state.dart';
import 'package:flutter_app_challenge/ui/widgets/episode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view_model/index.dart'; // Import the ChaharacterWidget

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  final EpisodesBloc episodesBloc = EpisodesBloc();
  late final EpisodesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = EpisodesViewModel(episodesBloc);
  }

  @override
  Widget build(BuildContext context) {
    final episodesBloc = context.read<EpisodesBloc>();
    final EpisodesViewModel _viewModel= EpisodesViewModel(episodesBloc);

    return BlocBuilder<EpisodesBloc, EpisodesState>(
    builder: (context, state){
      return Scaffold(
      appBar: AppBar(
        title: const Text('Episodios'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                'Cargados: ${state.pagesFetched * 20}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE9E8E4),
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  context.read<EpisodesBloc>().add(FetchEpisodesEvent());
                },
                child: const Text('Cargar'),
              ),
              const SizedBox(height: 16),
              if (state.episodes.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.episodes.length,
                    itemBuilder: (context, index) {
                      final episode = state.episodes[index];
                      return EpisodeWidget(episode: episode);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    });
  }
}