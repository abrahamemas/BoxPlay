import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';
import 'package:music_app/service/artists_api/sad_screen_api/api.dart';

class SadSmallCard extends ConsumerWidget {
  final int startIndex;

  const SadSmallCard({Key? key, required this.startIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(fetchTracksDataProvider9);
    final data2 = ref.watch(fetchTracksDataProvider9);
    final data3 = ref.watch(fetchTracksDataProvider9);

    return GestureDetector(
      onTap: () {},
      child: Container(
        child: data.when(
          data: (data) {
            List<PlaylistType> artistsList = data.map((e) => e).toList();

            return Column(
              children: List.generate(
                4,
                (index) {
                  final dataIndex = startIndex + index;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).hoverColor,
                              image: DecorationImage(
                                image: NetworkImage(artistsList[dataIndex]
                                    .tracks
                                    .data
                                    .album
                                    .cover_medium),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 8),
                                child: Container(
                                  width: 150,
                                  child: Text(
                                    data2.when(
                                      data: (artistsList2) {
                                        return artistsList2[dataIndex]
                                            .tracks
                                            .data
                                            .title_short;
                                      },
                                      error: (err, s) => 'Error',
                                      loading: () => 'Loading',
                                    ),
                                    style: TextStyles.smalltext(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 25),
                                child: Container(
                                  width: 150,
                                  child: Text(
                                    data3.when(
                                      data: (artistsList3) {
                                        return artistsList3[dataIndex]
                                            .tracks
                                            .data
                                            .artist
                                            .name;
                                      },
                                      error: (err, s) => 'Error',
                                      loading: () => 'Loading',
                                    ),
                                    style: TextStyles.smalltext2(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Text(
            'Loading',
            style: TextStyle(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
