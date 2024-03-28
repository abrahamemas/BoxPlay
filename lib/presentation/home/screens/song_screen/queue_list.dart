import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';

import '../../../../service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class QueueListScreen extends ConsumerWidget {
  const QueueListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingSongs =
        ref.watch(selectedTrackProvider.notifier).getUpcomingSongs();
    return ListView.builder(
        itemCount: upcomingSongs.length,
        itemBuilder: (context, index) {
          final track = upcomingSongs[index];
          return GestureDetector(
            onTap: () async {
              final selectedTrack = upcomingSongs[index];
              ref
                  .read(playPauseProvider.notifier)
                  .togglePlayPause(selectedTrack.preview);
              ref.read(selectedTrackProvider.notifier).setSelectedTrack(
                  selectedTrack,
                  upcomingSongs
                      .map((item) => PlaylistType(tracks: Track(data: item)))
                      .toList());

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongScreen()),
              );
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).hoverColor,
                      image: DecorationImage(
                        image: NetworkImage(track.album.cover_medium),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80, top: 10),
                      child: Container(
                        width: 200,
                        child: Text(
                          track.title_short,
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
                      padding: const EdgeInsets.only(left: 80, top: 30),
                      child: Container(
                        width: 200,
                        child: Text(
                          track.artist.name,
                          style: TextStyles.smalltext2(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 340, top: 12),
                  child: Icon(
                    Icons.download_for_offline_outlined,
                    color: Theme.of(context).hintColor,
                    size: 24,
                  ),
                ),
                Container(
                  height: 70,
                  child: Transform.translate(
                    offset: Offset(360, -10),
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
                ),
              ],
            ),
          );
        });
  }
}
