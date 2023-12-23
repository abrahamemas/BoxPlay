import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/buttons/Iconbutton.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/model.dart';
import 'package:music_app/service/artists_api/workout_screen_api/bottom_grid_api/api.dart';
class GridCard extends ConsumerWidget {
  const GridCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistsBottomDataProvider);
    final data2 = ref.watch(artistsBottomTitleDataProvider);

    return SizedBox(
      
      child: data.when(
        data: (data) {
          List<Model> artistscoverList = data.map((e) => e).toList();

          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 5, 
              crossAxisSpacing: 5, 
            ),
          
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(artistscoverList[index].picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(padding: EdgeInsets.only(left: 30,),
                    child: IconButtonPlay(height: 28, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0, top: 128), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                           Expanded(
                             child: Container(
                              width: 200,
                              child: data2.when(
                                data: (artistsTitleList2) {
                                  return Text(
                                    artistsTitleList2[index].title,
                                    style: TextStyles.smalltext(context),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },
                                error: (err, s) => Text(err.toString()),
                                loading: () => const Text('Loading'),
                              ),
                                                     ),
                           ),
                        
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        error: (err, s) => Text(
          err.toString(),
          style: TextStyle(color: Colors.red),
        ),
        loading: () => const Text('Loading'),
      ),
    );
  }
}



