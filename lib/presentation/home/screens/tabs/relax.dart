import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/bottom_card/bottomcards.dart';
import 'package:music_app/presentation/home/widgets/cards/relax_card/relax_card.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class RelaxScreen extends StatelessWidget {
  const RelaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15),
          child: Text(
            'Today’s Refreshing Song-Recommendations',
            style: TextStyles.bigtext(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: RelaxCard(),
        ),
        Padding(
          padding: EdgeInsets.only(right: 220, top: 15),
          child: Text(
            'Mixes for you',
            style: TextStyles.bigtext(context),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: BottomMidCard()),
        ),
      ],
    );
  }
}
