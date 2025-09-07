

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_challenge/data/repositories/characters_repo.dart';
import 'events.dart';
import 'state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepo _repo;

  CharactersBloc({CharactersRepo? repo})
      : _repo = repo ?? CharactersRepo(),
        super(const CharactersInitial()) {
    on<AddCharactersEvent>(_onAddCharacters);
    on<FetchCharactersEvent>(_fetchAndAddCharacters);
    on<IncreasePageEvent>(_increasePage);
  }

  void _increasePage(
      IncreasePageEvent event, Emitter<CharactersState> emit) {
    if (state is CharactersValue) {
      final currentState = state as CharactersValue;
      emit(CharactersValue(currentState.characters, pagesFetched: currentState.pagesFetched + 1));
    }
  }

  Future<void> _fetchAndAddCharacters(
      FetchCharactersEvent event, Emitter<CharactersState> emit) async {
    final fetchedCharacters = await _repo.getCharacters(state.pagesFetched + 1);

    print(fetchedCharacters.length);
    add(AddCharactersEvent(fetchedCharacters));
    add(IncreasePageEvent());
  }

  void _onAddCharacters(
      AddCharactersEvent event, Emitter<CharactersState> emit) {
  if(state is CharactersValue){
    final currentState = state as CharactersValue;
    final updatedCharacters = List<dynamic>.from(currentState.characters)..addAll(event.charactersInput);
    emit(CharactersValue(updatedCharacters, pagesFetched: currentState.pagesFetched ));
  } else {
    emit(CharactersValue(event.charactersInput, pagesFetched: 0));
  }
}
}

