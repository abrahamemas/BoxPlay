import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';

import '../../../../service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class UpcomingSongs extends ConsumerWidget {
  const UpcomingSongs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingSongs =
        ref.watch(selectedTrackProvider.notifier).getUpcomingSongs();
    return ListView.builder(
        itemCount: 1,
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
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Container(
                    height: 65,
                    width: 65,
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
                      padding: const EdgeInsets.only(left: 90, top: 23),
                      child: Container(
                        width: 200,
                        child: Text(
                          track.title_short,
                          style: TextStyles.text5(context),
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
                      padding: const EdgeInsets.only(left: 90, top: 55),
                      child: Container(
                        width: 200,
                        child: Text(
                          track.artist.name,
                          style: TextStyles.text5(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
