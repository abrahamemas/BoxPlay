import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistscard_api/artists_model.dart';
import 'package:music_app/service/artists_api/relax_screen_api/card_2_api/midcardsapi/api.dart';

class RelaxMidCard2 extends ConsumerWidget {
  const RelaxMidCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistsDataProvider3);
    final data2 = ref.watch(artistsTitleDataProvider4);

    return Stack(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    artistsTitleList2[0].title,
                                    style: TextStyles.medium2(context),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
                          color:  Colors.transparent,
                          ),
                          ),
                      ),
                      

                    ],
                  )
            );
          },
          error: (err, s) => Text(
           err.toString(),
            style: TextStyle(color: Colors.red),
          ),
          loading: () => const Text(
            'Loading',
            style: TextStyle(
            color:  Colors.transparent,

            ),
            ),
        ),
      
  

      ],
    );
  }
}