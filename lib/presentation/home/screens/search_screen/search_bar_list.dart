import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';
import 'package:music_app/service/search_page_api/trending_artistd_api/search_api.dart';

import '../../../../service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class SearchResultsList extends ConsumerWidget {
  const SearchResultsList({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  final String searchQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchMusicDataProvider(searchQuery));

    return Container(
      child: data.when(
        data: (data) {
          List<PlaylistType> artistscoverList = data.map((e) => e).toList();
          return ListView.separated(
            padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.vertical,
            itemCount: 4,
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
                      height: 50,
                      width: 50,
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
