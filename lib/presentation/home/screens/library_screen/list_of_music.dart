import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';

import '../../../../service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';
import 'package:music_app/service/newly_released/api.dart';

class NewlyReleased extends ConsumerWidget {
  const NewlyReleased({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(newlyTracksDataProvider);

    return Container(
      child: data.when(
        data: (data) {
          List<PlaylistType> artistscoverList = data.map((e) => e).toList();
          return ListView.separated(
            padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.vertical,
            itemCount: 50,
            itemBuilder: (BuildContext context, index) {
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
                child: Stack(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                    Padding(
                      padding: EdgeInsets.only(left: 75, top: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              artistscoverList[index].tracks.data.title_short,
                              style: TextStyles.smalltext(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(320, 0),
                      child: PopupMenuButton<String>(
                        iconColor: Theme.of(context).primaryColor,
                        color: Theme.of(context).hintColor,
                        onSelected: (value) {
                          print('Selected: $value');
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'add to playlist',
                              child: Text(
                                'Add to playlist',
                                style: TextStyle(
                                  color: Theme.of(context).hoverColor,
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'remove',
                              child: Text('Remove'),
                            ),
                            PopupMenuItem<String>(
                              value: 'download',
                              child: Text('Download'),
                            ),
                          ];
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 75, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              artistscoverList[index].tracks.data.artist.name,
                              style: TextStyles.smalltext2(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, _) => const SizedBox(width: 50),
          );
        },
        error: (err, s) => Text(
          err.toString(),
          style: TextStyle(color: Colors.red),
        ),
        loading: () => const Text(
          'Loading',
          style: TextStyle(color: Colors.transparent),
        ),
      ),
    );
  }
}
