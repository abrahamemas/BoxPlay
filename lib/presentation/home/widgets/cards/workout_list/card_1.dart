import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistscard_api/artists_model.dart';
import 'package:music_app/service/artists_api/workout_screen_api/api.dart';

class WorkoutSmallCard extends ConsumerWidget {
  final int startIndex;

  const WorkoutSmallCard({Key? key, required this.startIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistsDataProvider5);
    final data2 = ref.watch(artistsTitleDataProvider8);

    return SizedBox(
      height: 300,
      child: data.when(
        data: (data) {
          List<ArtistsModel> artistsList = data.map((e) => e).toList();

          return ListView.separated(
            padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (BuildContext context, index) {
              final dataIndex = startIndex + index;
              return Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(artistsList[dataIndex].picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  data2.when(
                    data: (artistsList2) {
                      return Positioned(
                        right: 95,
                        bottom: 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 150,
                                child: Text(
                                  artistsList2[dataIndex].title,
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
                    loading: () => const Text('Loading'),
                  ),
                ],
              );
            },
            separatorBuilder: (context, _) => const SizedBox(height: 20),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Text('Loading'),
      ),
    );
  }
}

