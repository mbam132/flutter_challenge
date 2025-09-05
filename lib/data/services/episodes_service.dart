import 'package:dio/dio.dart';

class EpisodesService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchEpisodes(int page) async {
    final response = await _dio.get('https://rickandmortyapi.com/api/episode',
      queryParameters: {'page': page},
    );
    if (response.statusCode == 200) {
      return response.data['results'];
    } else {
      throw Exception('Failed to fetch episodes');
    }
  }
}