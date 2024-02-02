import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService();

  Future<List<PlaylistType>> fetchTracks() async {
    print('fetchTracks is called');
    const url =
        'https://corsproxy.io/?https://api.deezer.com/playlist/3153080842';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    final List<dynamic> tracksJson = json['tracks']['data'] ?? [];
    final List<PlaylistType> tracks = tracksJson.map((trackJson) {
      return PlaylistType.fromJson(trackJson);
    }).toList();

    print('fetchTracks completed');
    return tracks;
  }
}

final fetchTracksProvider = Provider<ApiService>((ref) => ApiService());

final fetchTracksDataProvider11 =
    FutureProvider<List<PlaylistType>>((ref) async {
  final apiService = ref.read(fetchTracksProvider);
  return apiService.fetchTracks();
});
