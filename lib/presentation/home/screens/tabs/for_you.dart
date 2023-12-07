import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/alignment.dart';
import 'package:music_app/presentation/home/widgets/cards/Bigcards.dart';
import 'package:music_app/presentation/home/widgets/cards/midcards.dart';
import 'package:music_app/presentation/home/widgets/cards/smallcards.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class For_You extends StatelessWidget {
  
  final List<String> smallText = [
    'New',
    'Weekly',
    'Best',
    'Chilled',
    'Executive'
  ];
   final List<String> cardTexts = [
    'ENGLISH \nSONGS',
    'TOP 20',
    'AFROBEATS',
    'RHYTHM\nSOUL',
    'HIP\nPOP'
  ];

  final List<String> cardImages = [
    'assets/Card9.jpg',
    'assets/Card6.jpg',
    'assets/Card7.jpg',
    'assets/Card5.jpg',
    'assets/Card2.jpg',
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Placement(
          translateX: -98,
          translateY: 15,
          child: Text(
            'Featuring Today',
            style: TextStyles.bigtext(context),
          ),
        ),
        Placement(
          translateX: -15,
          translateY: 30,
          child: Container(
            height: 140,
          
            child: ListView.separated(
              padding: EdgeInsets.only(right: 30,left: 30),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return BigCard(
                  text: cardTexts[index],
                  image: cardImages[index],
                  smallText: smallText[index],
                );
              },
              separatorBuilder: (context, _) => SizedBox(width: 20),
            ),
          ),
        ),
        SizedBox(height: 8), 
           Placement(
          translateX: 20,
          translateY: 45,
          child: Row(
            children: [
              Text(
                'Recently Played',
                style: TextStyles.bigtext(context),
              ),
              SizedBox(width: 90,),
               Text(
                'See more',
                style: TextStyles.text2(context),
              ),

            ],
          ),
        ),
          SizedBox(height: 20), 
          
            
              Placement(translateX: 15,
              translateY: 50,
              child: CardScreen()),

                  Placement(
          translateX: 20,
          translateY: 30,
          child: Row(
            children: [
              Text(
                'Mixes for you',
                style: TextStyles.bigtext(context),
              ),
             

            ],
          ),
        ),
        
           SizedBox(height: 20), 
          
            
              Placement(translateX: 15,
              translateY: 50,
              child: MidCardScreen()),


              


             
           
        


      ],
    );
  }
}