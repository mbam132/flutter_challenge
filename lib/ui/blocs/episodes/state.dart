import 'package:equatable/equatable.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<dynamic> get episodes => [];

  @override
  final int pagesFetched = 0;
}

class EpisodesInitial extends EpisodesState {
  const EpisodesInitial();

  @override
  List<dynamic> get episodes => [];

  @override
  int get pagesFetched => 0;

  @override
  List<Object?> get props => [null]; 
}

class EpisodesValue extends EpisodesState {
  @override
  final List<dynamic> episodes;

  @override
  final int pagesFetched;

  const EpisodesValue(this.episodes, {this.pagesFetched = 0});

  @override
  List<Object> get props => [episodes, pagesFetched];
}