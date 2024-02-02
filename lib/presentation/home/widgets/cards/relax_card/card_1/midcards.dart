import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

import 'package:music_app/service/artists_api/relax_screen_api/card_1_api/midcardsapi/api.dart';
import 'package:music_app/service/artists_api/relax_screen_api/card_1_api/midcardsapi/artists_model.dart';

class RelaxMidCard extends ConsumerWidget {
  const RelaxMidCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistsDataProvider2);
    final data2 = ref.watch(artistsTitleDataProvider3);

    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          data.when(
            data: (data) {
              List<ArtistsModel> artistscoverList = data.map((e) => e).toList();
              return SizedBox(
                  height: 106,
                  child: Stack(
                    children: [
                      Container(
                        height: 106,
                        width: 106,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).hoverColor,
                          image: DecorationImage(
                            image: NetworkImage(artistscoverList[0].picture),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      data2.when(
                        data: (artistsTitleList2) {
                          return Padding(
                            padding: EdgeInsets.only(left: 120, top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Text(
                                          artistsTitleList2[0].title,
                                          style: TextStyles.medium2(context),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 26),
                                        child: Text(
                                          '40 songs',
                                          style: TextStyles.text3(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        error: (err, s) => Text(err.toString()),
                        loading: () => const Text(
                          'Loading',
                          style: TextStyle(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ));
            },
            error: (err, s) => Text(
              err.toString(),
              style: TextStyle(color: Colors.red),
            ),
            loading: () => const Text(
              'Loading',
              style: TextStyle(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
