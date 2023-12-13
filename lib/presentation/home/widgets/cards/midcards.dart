import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/artistsmidcardsapi/api.dart';
import 'package:music_app/service/artists_api/artistsmidcardsapi/model.dart';


class MidCardScreen extends ConsumerWidget {
  const MidCardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistscoverDataProvider);
    final data2 = ref.watch(artistsTitleDataProvider2);
    
    return SizedBox(
      height: 160,
      child: data.when(
        data: (data) {
          List<Model> artistscoverList = data.map((e) => e).toList();                 
          return   
             ListView.separated(
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
                              Container(
                                width: 120, 
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
                      loading: () => const CircularProgressIndicator(),
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

