import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/splash_screen/splash_screen.dart';
import 'package:music_app/presentation/home/widgets/buttons/Iconbutton.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/artistscard_api/artists_model.dart';
import 'package:music_app/service/artists_api/artistscard_api/api.dart';

class SmallCardScreen extends ConsumerWidget {
  const SmallCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistsDataProvider);
    final data2 = ref.watch(artistsTitleDataProvider);

    return SizedBox(
      height: 120,
      child: data.when(
        data: (data) {
          List<ArtistsModel> artistsList = data.map((e) => e).toList();

          return ListView.separated(
            padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.horizontal,
            itemCount: artistsList.length,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(artistsList[index].picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, top: 130),
                    child: IconButtonPlay(),
                  ),
                  data2.when(
                    data: (artistsList2) {
                      return Padding(
                        padding: EdgeInsets.only(left: 0, top: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              
                              child: Text(
                                artistsList2[index].title,
                                style: TextStyles.smalltext(context),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    error: (err, s) => Text(err.toString()),
                    loading: () => const CircularProgressIndicator(),
                  ),
                ],
              );
            },
            separatorBuilder: (context, _) => const SizedBox(width: 20),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Text('Loading')
      ),
    );
  }
}
