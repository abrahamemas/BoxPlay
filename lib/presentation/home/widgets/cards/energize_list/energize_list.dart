import 'package:flutter/widgets.dart';
import 'package:music_app/presentation/home/widgets/buttons/popupmenu_2.dart';
import 'package:music_app/presentation/home/widgets/cards/energize_list/card_1.dart';
import 'package:music_app/presentation/home/widgets/cards/energize_list/grid.dart';



class EnergizeListScreen extends StatelessWidget {
  const EnergizeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          padding: const EdgeInsets.only(right: 30),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            final startIndex = index * 4; 
          
            return Container(
              width: 350,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EnergizeSmallCard(startIndex: startIndex),
                  ),
                   
                  Transform.translate(
                    offset: Offset(4, -26),
                    child: Popup2(),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, _) => const SizedBox(width: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
           
              child:  SizedBox(
                height: 400,
                width: 800,
                child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: GridCard3(),
                    ),
              ),
                
            
          ),
        )
      ],
      



    );
  }
}

