import 'package:flutter/material.dart';
import '../../../data/repositories/characters_repo.dart';

class CharacterViewModel extends ChangeNotifier {
  final CharactersRepo _repo = CharactersRepo();
  List<dynamic> characterResult = [];

  Future<void> searchCharacter(String name) async {
    final result = await _repo.getCharacter(name);
    characterResult = result.isNotEmpty ? [result.first] : [];
    notifyListeners();
  }
}