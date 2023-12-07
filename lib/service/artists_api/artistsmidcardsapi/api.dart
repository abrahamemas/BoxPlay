import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/service/artists_api/artistsmidcardsapi/model.dart';
import 'package:music_app/service/artists_api/artistsmidcardsapi/model_title.dart';

class Api {
  static const String endpoint = 'https://api.deezer.com';

  Dio _dio = Dio();

  Api();
  Future<List<Model>> getArtistsCover() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=trap');
      if (response.statusCode == 200) {
        List<Model>? artistscoverList = [];

        
        List<dynamic> artistDataList2 = response.data['data'];

    
        Set<String> uniquePictureUrls = Set();

        
        artistscoverList = artistDataList2.map((artistData2) {
          String pictureUrl = artistData2['album']['cover'];
          if (!uniquePictureUrls.contains(pictureUrl)) {
            uniquePictureUrls.add(pictureUrl);
            return Model.fromJson(artistData2['album']);
          } else {

            return null;
          }
        }).where((artist) => artist != null).cast<Model>().toList();

        return artistscoverList;
      } else {
        throw Exception("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
   Future<List<ModelTitle>> getArtistsTitleCover() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=trap');
      if (response.statusCode == 200) {
        List<ModelTitle> artistsTitleList2 = [];

        List<dynamic> artistDataList2 = response.data['data'];

        Set<String> uniqueTitles = Set();

        artistsTitleList2 = artistDataList2
            .map((artistData2) {
              String title = artistData2['ablum']['title'];
              if (!uniqueTitles.contains(title)) {
                uniqueTitles.add(title);
                return ModelTitle.fromJson(artistData2['album']);
              } else {
                return null;
              }
            })
            .where((artist) => artist != null)
            .cast<ModelTitle>()
            .toList();

        return artistsTitleList2;
      } else {
        throw Exception("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to load data: $error");
    }
  }
}
final artistscoverProvider = Provider<Api>((ref) => Api());

final artistscoverDataProvider = FutureProvider<List<Model>>((ref) async {
  final apicoverservices = ref.read(artistscoverProvider);
  return apicoverservices.getArtistsCover();
});
final artistsTitleProvider2 = Provider<Api>((ref) => Api());

final artistsTitleDataProvider2 = FutureProvider<List<ModelTitle>>((ref) async {
  final apiservices2 = ref.read(artistsTitleProvider2);
  return apiservices2.getArtistsTitleCover();
});
