import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/buttons/playbutton2.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistscard_api/api.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class SmallCardScreen extends ConsumerWidget {
  const SmallCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(fetchTracksDataProvider2);
    final data2 = ref.watch(fetchTracksDataProvider2);

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 120,
        child: data.when(
          data: (data) {
            List<PlaylistType> artistsList = data.map((e) => e).toList();

            return ListView.separated(
              padding: const EdgeInsets.only(right: 30),
              scrollDirection: Axis.horizontal,
              itemCount: 13,
              itemBuilder: (BuildContext context, index) {
                return Stack(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).hoverColor,
                        image: DecorationImage(
                          image: NetworkImage(artistsList[index]
                              .tracks
                              .data
                              .album
                              .cover_medium),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: PlayButton2(
                        height: 24,
                        size: 16,
                      ),
                    ),
                    data2.when(
                      data: (artistsList2) {
                        return Padding(
                          padding: EdgeInsets.only(left: 0, top: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    artistsList2[index].tracks.data.title_short,
                                    style: TextStyles.smalltext(context),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      error: (err, s) => Text(err.toString()),
                      loading: () => const Text(
                        'Loading',
                        style: TextStyle(color: Colors.transparent),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, _) => const SizedBox(width: 20),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Text(
            'Loading',
            style: TextStyle(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
