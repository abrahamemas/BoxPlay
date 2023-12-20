import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/buttons/Iconbutton.dart';
import 'package:music_app/presentation/home/widgets/buttons/like_icon_button.dart';
import 'package:music_app/presentation/home/widgets/buttons/popupmenu.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/card_1/midcards.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/card_1/smallcards.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/card_2/midcards.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/card_2/smallcards.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/card_3/midcards.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/card_3/smallcards.dart';

class RelaxCard extends StatelessWidget {
  const RelaxCard({super.key});

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            height: 408,          
            child: 
                ListView.separated(
                  padding: const EdgeInsets.only(right: 30),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                      return Container(
                    height: 408,
                    width: 288,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  Color.fromRGBO(255, 255, 255, 0.08),
                    ),
                    child:   Stack(
                      children: [
                          if (index == 0) 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: RelaxMidCard(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 17),
                            child: RelaxSmallCard(),
                          ),
                                  
                        ],
                      )else if (index == 1)
                         Column(
                          children: [
                              Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: RelaxMidCard2(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 17),
                            child: RelaxSmallCard2(),
                          ),
                            
                          ],
                         )else if (index == 2)
                         Column(
                          children: [
                              Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: RelaxMidCard3(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 17),
                            child: RelaxSmallCard3(),
                          ),
                            
                          ],
                         ),


                         Padding(
                           padding: const EdgeInsets.only(top: 120),
                           child: Popup(),
                         ),
                          Positioned(
                    right: 82,
                    top: 80,
                    child: Center(
                      child: PopupMenuButton<String>(
                        color: Theme.of(context).primaryColor,
                        onSelected: (value) {
                          print('Selected: $value');
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem<String>(
                              value: 'option1',
                              child: Text('Option 1'),
                            ),
                         
                          ];
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 128,
                    top: 90,
                    child: LikeHeartIcon()
                    ),

                  Positioned(
                    right: -10,
                    top: 2,
                    child: IconButtonPlay(height: 40, size: 30,),
                     ),
                        



                               



                       Positioned(
                  right: 25,
                  top: 350,
                  child: Container(
                    height: 30,
                    width: 64,
                    child: ElevatedButton(
                      onPressed: (){}, 
                       style: ElevatedButton.styleFrom(
                       primary: Theme.of(context).primaryColor , 
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18), 
                          ),
                        ),
                      
                    child: Center(
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color:Theme.of(context).hoverColor
                        ),
                        ))),
                  ),
                ),
                          
                             ],
                    ),
                        
                      
                            
                  );
                    },
                              separatorBuilder: (context, _) => const SizedBox(width: 20),
                  
                ),
                
              
            
          );
  }
}