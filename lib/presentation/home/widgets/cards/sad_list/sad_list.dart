import 'package:flutter/widgets.dart';
import 'package:music_app/presentation/home/widgets/buttons/popupmenu_2.dart';
import 'package:music_app/presentation/home/widgets/cards/sad_list/Listcard.dart';

import 'package:music_app/presentation/home/widgets/cards/sad_list/card_1.dart';

class SadListScreen extends StatelessWidget {
  const SadListScreen({super.key});

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
                    child: SadSmallCard(startIndex: startIndex),
                  ),
                  Transform.translate(
                    offset: Offset(40, -26),
                    child: Popup2(),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, _) => const SizedBox(width: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 450),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ListCard2(),
          ),
        ),
      ],
    );
  }
}
