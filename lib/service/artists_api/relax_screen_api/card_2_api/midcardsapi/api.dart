import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistscard_api/artists_model.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistscard_api/model_title.dart';

class ApiService {
  static const String endpoint = 'https://api.deezer.com';
  Dio _dio = Dio(
    BaseOptions(
    baseUrl: endpoint,
    connectTimeout: Duration(seconds: 1) ,
  ),
  );

  ApiService();
  Future<List<ArtistsModel>> getArtists() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=michael jackson');
      if (response.statusCode == 200) {
        List<ArtistsModel>? artistsList = [];

        
        List<dynamic> artistDataList = response.data['data'];

    
        Set<String> uniquePictureUrls = Set();

        
        artistsList = artistDataList.map((artistData) {
          String pictureUrl = artistData['artist']['picture'];
          if (!uniquePictureUrls.contains(pictureUrl)) {
            uniquePictureUrls.add(pictureUrl);
            return ArtistsModel.fromJson(artistData['artist']);
          } else {

            return null;
          }
        }).where((artist) => artist != null).cast<ArtistsModel>().toList();

        return artistsList;
      } else {
        throw Exception("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
   Future<List<ArtistsModelTitle>> getArtistsTitle() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=michael jackson');
      if (response.statusCode == 200) {
        List<ArtistsModelTitle> artistsList = [];

        List<dynamic> artistDataList = response.data['data'];

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
        throw Exception("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
}

final artistsProvider3 = Provider<ApiService>((ref) => ApiService());

final artistsDataProvider3 = FutureProvider<List<ArtistsModel>>((ref) async {
  final apiServices = ref.read(artistsProvider3);
  return apiServices.getArtists();
});
final artistsProvider4 = Provider<ApiService>((ref) => ApiService());

final artistsTitleDataProvider4 = FutureProvider<List<ArtistsModelTitle>>((ref) async {
  final apiService = ref.read(artistsProvider4);
  return apiService.getArtistsTitle();
});