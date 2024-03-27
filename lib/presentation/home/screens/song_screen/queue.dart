import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/song_screen/queue_list.dart';
import 'package:music_app/presentation/home/screens/song_screen/song_screen.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';

class QueueScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTrack = ref.watch(selectedTrackProvider);
    if (selectedTrack != null) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).hoverColor,
                image: DecorationImage(
                  image: NetworkImage(selectedTrack.album.cover_big),
                  fit: BoxFit.cover,
                ),
              ),
              child: BlurryContainer(
                blur: 5,
                color: Colors.transparent,
                height: 80,
                elevation: 0,
                padding: const EdgeInsets.all(8),
                child: Stack(children: [
                  Transform.translate(
                    offset: Offset(5, 4),
                    child: Container(
                      height: 50,
                      child: IconButton(
                        iconSize: 32,
                        color: Theme.of(context).primaryColor,
                        icon: Transform.rotate(
                          angle: -3.14 / 2,
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SongScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 78, top: 15),
                        child: Text(
                          'Now Playing:',
                          style: TextStyles.smalltext5(context),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 78),
                            child: Container(
                              width: 70,
                              child: Text(
                                selectedTrack.title_short,
                                style: TextStyles.text4(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            child: Text(
                              '-',
                              style: TextStyles.text4(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Container(
                              width: 150,
                              child: Text(
                                selectedTrack.artist.name,
                                style: TextStyles.text4(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              )),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'In Queue',
              style: TextStyles.bigtext1(context),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: QueueListScreen(),
          ))
        ]),
      );
    } else {
      return Container();
    }
  }
}
