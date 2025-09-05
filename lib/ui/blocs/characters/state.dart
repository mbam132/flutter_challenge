
import 'package:equatable/equatable.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<dynamic> get characters => [];

  @override
  final int pagesFetched = 0;
}

class CharactersInitial extends CharactersState {
  const CharactersInitial();

  @override
  List<dynamic> get characters => [];

  @override
  int get pagesFetched => 0;

  @override
  List<Object?> get props => [null]; 
}

class CharactersValue extends CharactersState {
  @override
  final List<dynamic> characters;

  @override
  final int pagesFetched;

  const CharactersValue(this.characters, {this.pagesFetched = 0});

  @override
  List<Object> get props => [characters, pagesFetched];
}