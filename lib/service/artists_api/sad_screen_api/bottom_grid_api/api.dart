import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/model.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/model_title.dart';

class Api {
  static const String endpoint = 'https://api.deezer.com';

  Dio _dio = Dio(
    BaseOptions(
    baseUrl: endpoint,
    connectTimeout: Duration(seconds: 1) ,
  ),
  );

  Api();
  Future<List<Model>> getArtistsCover() async {
    try {
      Response response = await _dio.get('$endpoint/search?q=billie eilish');
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
      Response response = await _dio.get('$endpoint/search?q=billie eilish');
      if (response.statusCode == 200) {
        List<ModelTitle> artistsTitleList2 = [];

        List<dynamic> artistDataList2 = response.data['data'];

        Set<String> uniqueTitles = Set();

        artistsTitleList2 = artistDataList2
            .map((artistData2) {
              String title = artistData2['album']['title'];
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
final artistsBottomProvider2 = Provider<Api>((ref) => Api());

final artistsBottomDataProvider2 = FutureProvider<List<Model>>((ref) async {
  final apicoverservices = ref.read(artistsBottomProvider2);
  return apicoverservices.getArtistsCover();
});
final artistsBottomTitle2 = Provider<Api>((ref) => Api());

final artistsBottomTitleDataProvider2 = FutureProvider<List<ModelTitle>>((ref) async {
  final apiservices2 = ref.read(artistsBottomTitle2);
  return apiservices2.getArtistsTitleCover();
});
