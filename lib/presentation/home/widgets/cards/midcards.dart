import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/splash_screen/splash_screen.dart';
import 'package:music_app/presentation/home/widgets/alignment.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

import 'package:music_app/service/artists_api/artistsmidcardsapi/api.dart';
import 'package:music_app/service/artists_api/artistsmidcardsapi/model.dart';


class MidCardScreen extends ConsumerWidget {
  const MidCardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistscoverDataProvider,);
        final data2 = ref.watch(artistsTitleDataProvider2);
    return SizedBox(
     height: 120,
      child: data.when(
        data: (data) {
          List<Model> artistscoverList = data.map((e) => e).toList();
                    
          return ListView.separated(
             padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return 
                 Stack(
                   children: [
                        Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(artistscoverList[index].picture),
                         fit: BoxFit.cover, 
                      ),
                    ),         
                      ),
                    
                       ],
                 );
              
            },separatorBuilder: (context, _) => const SizedBox(width: 20),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => 
          const Placement(translateX: -20,
          translateY: 0,
          child: SplashScreen()),
        
      ),
    );
  }
}
