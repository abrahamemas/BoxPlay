import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/library_screen/cards.dart';
import 'package:music_app/presentation/home/screens/library_screen/list_of_music.dart';
import 'package:music_app/presentation/home/widgets/buttons/buttom_nav_bar.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class Library extends ConsumerWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final List<Icon> cardIcons = [
      Icon(
        Icons.favorite_border,
        color: Theme.of(context).primaryColor,
        size: 24,
      ),
      Icon(
        Icons.download_for_offline_outlined,
        color: Theme.of(context).primaryColor,
        size: 24,
      ),
      Icon(
        Icons.queue_music_rounded,
        color: Theme.of(context).primaryColor,
        size: 24,
      ),
      Icon(
        Icons.supervised_user_circle_outlined,
        color: Theme.of(context).primaryColor,
        size: 24,
      )
    ];
    final List<String> cardtexts = [
      'Liked Songs',
      'Downloads',
      'Playlists',
      'Artists',
    ];
    final List<String> smalltext = [
      '120 songs',
      '210 songs',
      '12 playlists',
      '3 artists',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Text(
                'Your Library',
                style: TextStyles.bigtext1(context),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 300,
                child: GridView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.all(18),
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 110,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CardScreen3(
                        text: cardtexts[index],
                        button: cardIcons[index],
                        smalltext: smalltext[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    Text('Newly Released', style: TextStyles.bigtext(context)),
                    SizedBox(width: constraints.maxWidth > 600 ? 470 : 180),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('See more', style: TextStyles.text4(context)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 800,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: NewlyReleased(),
                ),
              ),
            ]),
          ),
          bottomNavigationBar: ButtomNavBar(),
        );
      },
    );
  }
}
