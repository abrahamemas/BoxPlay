import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/model.dart';
import 'package:music_app/service/artists_api/relax_screen_api/card_3_api/smallcardapi/api.dart';

class RelaxSmallCard3 extends ConsumerWidget {
  const RelaxSmallCard3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistscoverdataprovider3);
    final data2 = ref.watch(artistsTitledataprovider6);

    return SizedBox(
      height: 200,
      child: data.when(
        data: (data) {
          List<Model> artistscoverList = data.map((e) => e).toList();
          return ListView.separated(
            padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(artistscoverList[index].picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  data2.when(
                    data: (artistsTitleList2) {
                      return Positioned(
                        right: 95,
                         bottom:3 ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              child: Text(
                                artistsTitleList2[index].title,
                                style: TextStyles.smalltext(context),
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
              );
            },
            separatorBuilder: (context, _) => const SizedBox(height: 20),
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
    );
  }
}
