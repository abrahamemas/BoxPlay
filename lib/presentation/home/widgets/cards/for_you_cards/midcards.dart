import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/api.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/models.dart';

class MidCardScreen extends ConsumerWidget {
  const MidCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(fetchTracksDataProvider);
    final data2 = ref.watch(fetchTracksDataProvider);
    print(data);

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 120,
        child: data.when(
          data: (data) {
            List<PlaylistType> artistscoverList = data.map((e) => e).toList();
            return ListView.separated(
              padding: const EdgeInsets.only(right: 30),
              scrollDirection: Axis.horizontal,
              itemCount: 13,
              itemBuilder: (BuildContext context, index) {
                return Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
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
                    data2.when(
                      data: (artistsTitleList2) {
                        return Padding(
                          padding: EdgeInsets.only(left: 0, top: 130),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 120,
                                  child: Text(
                                    artistsTitleList2[index]
                                        .tracks
                                        .data
                                        .title_short,
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
          error: (err, s) => Text(
            err.toString(),
            style: TextStyle(color: Colors.red),
          ),
          loading: () => const Text(
            'Loading',
            style: TextStyle(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
