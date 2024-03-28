import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/queue.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SongScreen extends ConsumerWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTrack = ref.watch(selectedTrackProvider);
    if (selectedTrack != null) {
      final isPlaying = ref.watch(playPauseProvider);
      final audioPlayer = ref.watch(audioPlayerProvider);

      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(-10, 4),
                    child: Container(
                      height: 50,
                      child: IconButton(
                        iconSize: 24,
                        color: Theme.of(context).primaryColor,
                        icon: Transform.rotate(
                          angle: -3.14 / 2,
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(290, 10),
                    child: Column(
                      children: [
                        PopupMenuButton<String>(
                          iconSize: 28,
                          iconColor: Theme.of(context).primaryColor,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).hoverColor,
                    image: DecorationImage(
                      image: NetworkImage(selectedTrack.album.cover_big),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BlurryContainer(
                      blur: 12,
                      color: Colors.transparent,
                      height: 80,
                      elevation: 0,
                      padding: const EdgeInsets.all(8),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Center(
                        child: Container(
                          height: 280,
                          width: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).hoverColor,
                            image: DecorationImage(
                              image:
                                  NetworkImage(selectedTrack.album.cover_big),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 185, top: 16),
                child: Container(
                  height: 24,
                  width: 164,
                  decoration: BoxDecoration(
                    color: Theme.of(context).hoverColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Transform.translate(
                        offset: Offset(0, -4),
                        child: IconButton(
                            iconSize: 16,
                            color: Theme.of(context).primaryColor,
                            onPressed: () {},
                            icon: Icon(Icons.cast)),
                      ),
                      Expanded(
                        child: Transform.translate(
                          offset: Offset(-5, 0),
                          child: Text(
                            'Connect to a device',
                            style: TextStyles.smalltext(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 16),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                          ),
                          child: Container(
                            width: 220,
                            child: Text(
                              selectedTrack.title_short,
                              style: TextStyles.bigtext1(context),
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
                          padding: const EdgeInsets.only(
                            left: 24,
                          ),
                          child: Container(
                            width: 150,
                            child: Text(
                              selectedTrack.artist.name,
                              style: TextStyles.text3(context),
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
              Transform.translate(
                offset: Offset(0, -60),
                child: Padding(
                  padding: const EdgeInsets.only(left: 248),
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 24,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                      ),
                      IconButton(
                          iconSize: 24,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          icon: Icon(Icons.download_sharp)),
                      IconButton(
                          iconSize: 24,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          icon: Icon(Icons.share))
                    ],
                  ),
                ),
              ),
              StreamBuilder<Duration>(
                stream: ref.watch(audioPlayerProvider).onPositionChanged,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final currentPosition = snapshot.data!.inSeconds.toDouble();
                    final totalDuration = 30;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.translate(
                              offset: Offset(30, -5),
                              child: Text(
                                formatDuration(
                                    Duration(seconds: currentPosition.toInt())),
                                style: TextStyles.smalltext2(context),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-36, -5),
                              child: Text(
                                formatDuration(
                                    Duration(seconds: totalDuration)),
                                style: TextStyles.smalltext2(context),
                              ),
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, -58),
                          child: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 2,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 4),
                            ),
                            child: Container(
                              width: 390,
                              child: Slider(
                                min: 0,
                                max: 30,
                                value: isPlaying ? currentPosition : 0,
                                activeColor: Theme.of(context).primaryColor,
                                inactiveColor: Theme.of(context).hintColor,
                                onChanged: (value) {
                                  audioPlayer
                                      .seek(Duration(seconds: value.toInt()));
                                },
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(67, -45),
                          child: Row(
                            children: [
                              IconButton(
                                  color: Theme.of(context).primaryColor,
                                  iconSize: 24,
                                  onPressed: () async {},
                                  icon: Icon(Icons.shuffle)),
                              Transform.translate(
                                offset: Offset(2, 0),
                                child: IconButton(
                                    color: Theme.of(context).primaryColor,
                                    iconSize: 38,
                                    onPressed: () async {
                                      ref
                                          .read(selectedTrackProvider.notifier)
                                          .moveToPreviousTrack();
                                    },
                                    icon: Icon(Icons.skip_previous)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      ref
                                          .read(playPauseProvider.notifier)
                                          .togglePlayPause(
                                              selectedTrack.preview);
                                    },
                                    icon: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow_sharp,
                                      color: Color(0xff000000),
                                      size: 38,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: IconButton(
                                    iconSize: 38,
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () async {
                                      ref
                                          .read(selectedTrackProvider.notifier)
                                          .moveToNextTrack();
                                    },
                                    icon: Icon(Icons.skip_next_sharp)),
                              ),
                              IconButton(
                                  iconSize: 24,
                                  color: Theme.of(context).hoverColor,
                                  onPressed: () {},
                                  icon: Icon(Icons.repeat_sharp)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QueueScreen()),
                                  );
                                },
                                child: Text(
                                  "Up Next",
                                  style: TextStyles.bigtext2(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 170),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QueueScreen()),
                                  );
                                },
                                child: Text(
                                  "Queue",
                                  style: TextStyles.bigtext(context),
                                ),
                              ),
                            ),
                            IconButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios_sharp)),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: SpinKitCircle(
                        color: Theme.of(context).hintColor,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
