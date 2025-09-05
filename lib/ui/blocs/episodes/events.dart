abstract class EpisodesEvent {}

class AddEpisodesEvent extends EpisodesEvent {
	final List<dynamic> charactersInput;
	AddEpisodesEvent(this.charactersInput);
}

class FetchEpisodesEvent extends EpisodesEvent {
  FetchEpisodesEvent();
}

class IncreasePageEvent extends EpisodesEvent {
  IncreasePageEvent();
}