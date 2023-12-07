import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/splash_screen/splash_screen.dart';
import 'package:music_app/presentation/home/widgets/IconButton.dart';
import 'package:music_app/presentation/home/widgets/alignment.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/artists_api/artistscard_api/artists_model.dart';
import 'package:music_app/service/artists_api/artistscard_api/api.dart';


class CardScreen extends ConsumerWidget {
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(artistsDataProvider,);
        final data2 = ref.watch(artistsTitleDataProvider);
    return SizedBox(
     height: 180,
      child: data.when(
        data: (data) {
          List<ArtistsModel> artistsList = data.map((e) => e).toList();
                    
          return ListView.separated(
             padding: const EdgeInsets.only(right: 30),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return 
                 Stack(
                   children: [
                        Container(
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(artistsList[index].picture),
                         fit: BoxFit.cover, 
                      ),
                    ),
                    child: IconButtonPlay(),
                        
                      ),


                       
                         data2.when(data: (artistsList2){
                          return  Placement(
                            translateX: 0,
                            translateY: 98,
                            child:
                                Column(
                                  children: [
                                    Text(
                                       artistsList2[index].title,
                                      style: TextStyles.smalltext(context),
 
                                       
                              ),
                                  ],
                                ),
                            
                            
                          );
                         }, 
                         error: (err, s) => Text(err.toString()),
                          loading: () => 
                            const  CircularProgressIndicator(),
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
