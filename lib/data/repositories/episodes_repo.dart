import 'package:flutter_app_challenge/data/services/episodes_service.dart';

class EpisodesRepo {
  final EpisodesService _service = EpisodesService();

  Future<List<dynamic>> getEpisodes(int page) async {
        return await _service.fetchEpisodes(page);
  }
}