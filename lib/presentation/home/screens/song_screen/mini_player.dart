import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class MiniPlayer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTrack = ref.watch(selectedTrackProvider);
    if (selectedTrack != null) {
      final isPlaying = ref.watch(playPauseProvider);
      final audioPlayer = ref.watch(audioPlayerProvider);
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SongScreen()),
          );
        },
        child: Container(
          child: ClipRect(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff000000).withOpacity(0.12),
                          Color(0xff000000).withOpacity(0.4),
                        ],
                      ),
                    ),
                    child: BlurryContainer(
                        blur: 5,
                        color: Colors.transparent,
                        height: 80,
                        elevation: 0,
                        padding: const EdgeInsets.all(8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Container(
                                height: 48,
                                width: 48,
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
                            ),
                            SizedBox(width: 8.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 78, top: 5),
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
                                      const EdgeInsets.only(left: 78, top: 20),
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
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 330),
                              child: IconButton(
                                onPressed: () async {
                                  ref
                                      .read(playPauseProvider.notifier)
                                      .togglePlayPause(selectedTrack.preview);
                                },
                                icon: Icon(
                                  isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow_sharp,
                                  color: Colors.white,
                                  size: 38,
                                ),
                              ),
                            ),
                            StreamBuilder<Duration>(
                              stream: ref
                                  .watch(audioPlayerProvider)
                                  .onPositionChanged,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final currentPosition =
                                      snapshot.data!.inSeconds.toDouble();
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 67),
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 0),
                                      ),
                                      child: Slider(
                                        min: 0,
                                        max: 29,
                                        value: isPlaying ? currentPosition : 0,
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        inactiveColor:
                                            Theme.of(context).hoverColor,
                                        onChanged: (value) {
                                          audioPlayer.seek(
                                              Duration(seconds: value.toInt()));
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
