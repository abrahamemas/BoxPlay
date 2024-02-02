import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/service/artists_api/relax_screen_api/card_1_api/midcardsapi/artists_model.dart';
import 'package:music_app/service/artists_api/relax_screen_api/card_1_api/midcardsapi/model_title.dart';

class ApiService {
  static const String endpoint = 'https://corsproxy.io/?https://api.deezer.com';

  Dio _dio = Dio();

  ApiService();
  Future<List<ArtistsModel>> getArtists() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=Zayn');
      if (response.statusCode == 200) {
        List<ArtistsModel>? artistsList = [];

        List<dynamic> artistDataList = response.data['data'];

        Set<String> uniquePictureUrls = Set();

        artistsList = artistDataList
            .map((artistData) {
              String pictureUrl = artistData['artist']['picture_medium'];
              if (!uniquePictureUrls.contains(pictureUrl)) {
                uniquePictureUrls.add(pictureUrl);
                return ArtistsModel.fromJson(artistData['artist']);
              } else {
                return null;
              }
            })
            .where((artist) => artist != null)
            .cast<ArtistsModel>()
            .toList();

        return artistsList;
      } else {
        throw Exception(
            "Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }

  Future<List<ArtistsModelTitle>> getArtistsTitle() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=Zayn');
      if (response.statusCode == 200) {
        List<ArtistsModelTitle> artistsList = [];

        List<dynamic> artistDataList = response.data?['data'] ?? [];

        Set<String> uniqueTitles = Set();

        artistsList = artistDataList
            .map((artistData) {
              String title = artistData['artist']['name'];
              if (!uniqueTitles.contains(title)) {
                uniqueTitles.add(title);
                return ArtistsModelTitle.fromJson(artistData['artist']);
              } else {
                return null;
              }
            })
            .where((artist) => artist != null)
            .cast<ArtistsModelTitle>()
            .toList();

        return artistsList;
      } else {
        throw Exception(
            "Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
}

final artistsProvider6 = Provider<ApiService>((ref) => ApiService());

final artistsDataProvider2 = FutureProvider<List<ArtistsModel>>((ref) async {
  final apiServices = ref.read(artistsProvider6);
  return apiServices.getArtists();
});
final artistsProvider5 = Provider<ApiService>((ref) => ApiService());

final artistsTitleDataProvider3 =
    FutureProvider<List<ArtistsModelTitle>>((ref) async {
  final apiService = ref.read(artistsProvider5);
  return apiService.getArtistsTitle();
});
