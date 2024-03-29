import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';

import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';
import 'package:music_app/service/artists_api/relax_screen_api/card_1_api/smallcardapi/api.dart';

class RelaxSmallCard extends ConsumerWidget {
  const RelaxSmallCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(fetchTracksDataProvider3);
    final data2 = ref.watch(fetchTracksDataProvider3);

    return Container(
      child: data.when(
        data: (data) {
          List<PlaylistType> artistscoverList = data.map((e) => e).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                      SizedBox(width: 8.0),
                      data2.when(
                        data: (artistsTitleList2) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Container(
                                    width: 200,
                                    child: Text(
                                      artistsTitleList2[index]
                                          .tracks
                                          .data
                                          .title_short,
                                      style: TextStyles.smalltext(context),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.0),
                            ],
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
            }),
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
      ),
    );
  }
}
