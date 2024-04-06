import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/cards/for_you_cards/cards.dart';
import 'package:music_app/presentation/home/widgets/cards/for_you_cards/midcards.dart';
import 'package:music_app/presentation/home/widgets/cards/for_you_cards/smallcards.dart';
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
    'AFRO\nBEATS',
    'RHYTHM\nSOUL',
    'HIP POP'
  ];
  final List<String> cardImages = [
    'assets/Card9.jpg',
    'assets/Card6.jpg',
    'assets/Card7.jpg',
    'assets/Card5.jpg',
    'assets/Card2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: constraints.maxWidth > 600 ? 15 : 15,
                          top: constraints.maxHeight > 600 ? 5 : 5),
                      child: Text('Featuring Today',
                          style: TextStyles.bigtext(context)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth > 600 ? 0 : 0, top: 20),
                  child: Container(
                    height: 140,
                    child: ListView.separated(
                      padding: EdgeInsets.only(right: 30, left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CardScreen(
                          text: cardTexts[index],
                          image: cardImages[index],
                          smallText: smallText[index],
                        );
                      },
                      separatorBuilder: (context, _) => SizedBox(width: 20),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 25),
                  child: Row(
                    children: [
                      Text('Recently Played',
                          style: TextStyles.bigtext(context)),
                      SizedBox(width: constraints.maxWidth > 600 ? 480 : 185),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text('See more',
                              style: TextStyles.text4(context)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: SmallCardScreen(),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 30),
                  child: Row(
                    children: [
                      Text('Mixes for you', style: TextStyles.bigtext(context)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: MidCardScreen(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
