import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/for_you_screen_api/artistsmidcardsapi/model.dart';
import 'package:music_app/service/artists_api/relax_screen_api/bottom_card_api/midcard_api/api.dart';


class BottomMidCard extends ConsumerWidget {
  const BottomMidCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistscoverDataProvider3);
    final data2 = ref.watch(artistsTitleDataProvider7);
    
    return SizedBox(
      height: 160,
      child: data.when(
        data: (data) {
          List<Model> artistscoverList = data.map((e) => e).toList();                 
          return   
             ListView.separated(
              padding: const EdgeInsets.only(right: 40),
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
                        image: DecorationImage(
                          image: NetworkImage(artistscoverList[index].picture),
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
                                    artistsTitleList2[index].title,
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
                      loading: () => const Text('Loading'),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, _) => const SizedBox(width: 20),
            
          );
        },
        error: (err, s) => Text(err.toString(),
         style: TextStyle(color: Colors.red),
        ),
        loading: () => const Text('Loading'),
      ),
    );
  }
}

