abstract class CharactersEvent {}

class AddCharactersEvent extends CharactersEvent {
	final List<dynamic> charactersInput;
	AddCharactersEvent(this.charactersInput);
}

class FetchCharactersEvent extends CharactersEvent {
  FetchCharactersEvent();
}

class IncreasePageEvent extends CharactersEvent {
  IncreasePageEvent();
}