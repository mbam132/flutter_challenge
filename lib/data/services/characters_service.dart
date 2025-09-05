import 'package:dio/dio.dart';

class CharactersService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchCharacters(int page) async {
    final response = await _dio.get('https://rickandmortyapi.com/api/character',
      queryParameters: {'page': page},
    );
    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Failed to fetch characters');
    }
  }

  Future<List<dynamic>> fetchCharacter(String name) async {
    final response = await _dio.get('https://rickandmortyapi.com/api/character',
      queryParameters: {'name': name},
    );
    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Failed to fetch characters');
    }
  }
}