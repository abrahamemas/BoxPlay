import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

final searchProvider = Provider((ref) => SearchService());

class SearchService {
  Future<List<PlaylistType>> searchTracks(String query) async {
    final response = await http.get(Uri.parse(
        'https://corsproxy.io/?https://api.deezer.com/search?q=$query'));

    if (response.statusCode == 200) {
      final List<dynamic> tracksJson = json.decode(response.body)['data'];
      final List<PlaylistType> tracks = tracksJson.map((trackJson) {
        return PlaylistType.fromJson(trackJson);
      }).toList();
      return tracks;
    } else {
      throw Exception('Failed to load tracks');
    }
  }
}

final searchMusicProvider = Provider<SearchService>((ref) => SearchService());

final searchMusicDataProvider = FutureProvider.autoDispose
    .family<List<PlaylistType>, String>((ref, query) async {
  final apiService = ref.read(searchMusicProvider);
  return apiService.searchTracks(query);
});
