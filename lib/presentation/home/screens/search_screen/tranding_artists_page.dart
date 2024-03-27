import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';
import 'package:music_app/service/search_page_api/trending_artistd_api/api.dart';

import '../../../../service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class TrandingArtists extends ConsumerWidget {
  const TrandingArtists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(searchTracksDataProvider);
    final data2 = ref.watch(searchTracksDataProvider);

    return data.when(
      data: (data) {
        List<PlaylistType> artistscoverList = data.map((e) => e).toList();
        return Row(
          children: List.generate(
            30,
            (index) {
              return GestureDetector(
                onTap: () {
                  final selectedTrack = artistscoverList[index].tracks.data;
                  ref
                      .read(selectedTrackProvider.notifier)
                      .setSelectedTrack(selectedTrack, artistscoverList);
                  ref
                      .read(playPauseProvider.notifier)
                      .togglePlayPause(selectedTrack.preview);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongScreen()),
                  );
                },
                child: SizedBox(
                  height: 100,
                  child: Stack(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).hoverColor,
                          image: DecorationImage(
                            image: NetworkImage(artistscoverList[index]
                                .tracks
                                .data
                                .album
                                .cover_medium),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      data2.when(
                        data: (artistsTitleList2) {
                          return Padding(
                            padding: EdgeInsets.only(top: 70, left: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90,
                                  child: Text(
                                    artistsTitleList2[index]
                                        .tracks
                                        .data
                                        .title_short,
                                    style: TextStyles.smalltext3(context),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
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
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      error: (err, s) => Text(
        err.toString(),
        style: TextStyle(color: Colors.red),
      ),
      loading: () => const Text(
        'Loading',
        style: TextStyle(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
