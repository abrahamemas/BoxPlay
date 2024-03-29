import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class ApiService {
  ApiService();

  Future<List<PlaylistType>> fetchTracks() async {
    const url =
        'https://corsproxy.io/?https://api.deezer.com/playlist/8625952102';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    final List<dynamic> tracksJson = json['tracks']['data'] ?? [];
    final List<PlaylistType> tracks = tracksJson.map((trackJson) {
      return PlaylistType.fromJson(trackJson);
    }).toList();

    return tracks;
  }
}

final searchTracksProvider = Provider<ApiService>((ref) => ApiService());

final searchTracksDataProvider =
    FutureProvider<List<PlaylistType>>((ref) async {
  final apiService = ref.read(searchTracksProvider);
  return apiService.fetchTracks();
});
