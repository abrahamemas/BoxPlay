import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
class BigCard extends StatelessWidget {
  final String smallText;
  final String text;
  
  final String image;
  const BigCard({super.key,required this.image, required this.text, required this.smallText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 280,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
        image: AssetImage(image), 
        fit: BoxFit.cover, 
                ),
              ),
      
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50 ,left: 10),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    smallText,
                    style: TextStyles.text3(context),
                    ),
                    SizedBox(width: 10,),
                  Text(
                    text,
                    style: TextStyles.bigtext1(context),
                    ),
                     ],
              ),
            ),


          ],
        ),
      
      
    );
  }
}