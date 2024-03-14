import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';

class PlayButton2 extends ConsumerStatefulWidget {
  final double height;
  final double size;

  const PlayButton2({Key? key, required this.height, required this.size})
      : super(key: key);

  @override
  _PlayButton2State createState() => _PlayButton2State();
}

class _PlayButton2State extends ConsumerState<PlayButton2> {
  late bool isPlaying;

  @override
  void initState() {
    super.initState();
    isPlaying = false;
  }

  @override
  Widget build(BuildContext context) {
    final selectedTrack = ref.watch(selectedTrackProvider);

    return Padding(
      padding: const EdgeInsets.only(
        top: 42,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Transform.translate(
              offset: Offset(0, -4),
              child: IconButton(
                onPressed: () async {
                  if (selectedTrack != null) {
                    final playPauseNotifier =
                        ref.read(playPauseProvider.notifier);
                    await playPauseNotifier
                        .togglePlayPause(selectedTrack.preview);
                  }

                  setState(() {
                    isPlaying = selectedTrack != null ? !isPlaying : isPlaying;
                  });
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow_sharp,
                  size: widget.size,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
