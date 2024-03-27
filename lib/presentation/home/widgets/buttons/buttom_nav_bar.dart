import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/screens/home_screen/home_screen.dart';
import 'package:music_app/presentation/home/screens/library_screen/library_screen.dart';
import 'package:music_app/presentation/home/screens/search_screen/search_screen.dart';
import 'package:music_app/presentation/home/screens/song_screen/mini_player.dart';
import 'package:music_app/presentation/home/widgets/url_path.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Transform.translate(offset: Offset(0, -80), child: MiniPlayer()),
            Transform.translate(
              offset: Offset(0, 10),
              child: BottomNavigationBar(
                elevation: 0,
                selectedItemColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                unselectedItemColor: Theme.of(context).primaryColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: UrlPath(
                        UrlPath1: 'assets/home2.svg',
                        size: 24,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()),
                        );
                      },
                      child: UrlPath(
                        UrlPath1: 'assets/search.svg',
                        size: 24,
                      ),
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Library()),
                        );
                      },
                      child: UrlPath(
                        UrlPath1: 'assets/library_music.svg',
                        size: 24,
                      ),
                    ),
                    label: 'Your Library',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
