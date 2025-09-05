import 'package:bloc/bloc.dart';
import 'package:flutter_app_challenge/data/repositories/episodes_repo.dart';
import 'events.dart';
import 'state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodesRepo _repo;

  EpisodesBloc({EpisodesRepo? repo})
      : _repo = repo ?? EpisodesRepo(),
        super(const EpisodesInitial()) {
    on<AddEpisodesEvent>(_onAddEpisodes);
    on<FetchEpisodesEvent>(_fetchAndAddEpisodes);
    on<IncreasePageEvent>(_increasePage);
  }

  void _increasePage(
      IncreasePageEvent event, Emitter<EpisodesState> emit) {
    if (state is EpisodesValue) {
      final currentState = state as EpisodesValue;
      emit(EpisodesValue(currentState.episodes, pagesFetched: currentState.pagesFetched + 1));
    }
  }

  Future<void> _fetchAndAddEpisodes(
      FetchEpisodesEvent event, Emitter<EpisodesState> emit) async {
    final fetchedCharacters = await _repo.getEpisodes(state.pagesFetched + 1);

    add(AddEpisodesEvent(fetchedCharacters));
    add(IncreasePageEvent());
  }

  void _onAddEpisodes(
      AddEpisodesEvent event, Emitter<EpisodesState> emit) {
  if(state is EpisodesValue){
    final currentState = state as EpisodesValue;
    final updatedCharacters = List<dynamic>.from(currentState.episodes)..addAll(event.charactersInput);
    emit(EpisodesValue(updatedCharacters, pagesFetched: currentState.pagesFetched ));
  } else {
    emit(EpisodesValue(event.charactersInput, pagesFetched: 0));
  }
}
}
