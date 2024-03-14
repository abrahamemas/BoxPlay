import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';
import 'package:music_app/service/artists_api/workout_screen_api/api.dart';

class WorkoutSmallCard extends ConsumerWidget {
  final int startIndex;

  const WorkoutSmallCard({Key? key, required this.startIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final dataProvider = ref.watch(fetchTracksDataProvider7);

    return SingleChildScrollView(
      child: Container(
        height: 350,
        child: dataProvider.when(
          data: (data) {
            List<PlaylistType> artistsList = data.map((e) => e).toList();
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                final dataIndex = startIndex + index;
                final selectedTrack = artistsList[dataIndex].tracks.data;

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        final selectedTrack =
                            artistsList[dataIndex].tracks.data;
                        ref
                            .read(selectedTrackProvider.notifier)
                            .setSelectedTrack(selectedTrack, artistsList);
                        ref
                            .read(playPauseProvider.notifier)
                            .togglePlayPause(selectedTrack.preview);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SongScreen()),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).hoverColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                    selectedTrack.album.cover_medium),
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
                                    selectedTrack.title_short,
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
                                    selectedTrack.artist.name,
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
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
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
