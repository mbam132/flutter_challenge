import '../services/characters_service.dart';

class CharactersRepo {
  final CharactersService _service = CharactersService();

  Future<List<dynamic>> getCharacters(int page) async {
        return await _service.fetchCharacters(page);
  }

  Future<List<dynamic>> getCharacter(String name) async {
        return await _service.fetchCharacter(name);
  }
}