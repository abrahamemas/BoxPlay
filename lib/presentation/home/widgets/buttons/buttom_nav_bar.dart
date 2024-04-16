import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/screens/home_screen/home_screen.dart';
import 'package:music_app/presentation/home/screens/library_screen/library_screen.dart';
import 'package:music_app/presentation/home/screens/search_screen/search_screen.dart';
import 'package:music_app/presentation/home/screens/song_screen/mini_player.dart';
import 'package:music_app/presentation/home/widgets/url_path.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({Key? key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16.0), // Add some padding at the bottom
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MiniPlayer(),
          NavigationBar(
            elevation: 0,
            shadowColor: Theme.of(context).scaffoldBackgroundColor,
            indicatorColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
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
              NavigationDestination(
                icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  child: UrlPath(
                    UrlPath1: 'assets/search.svg',
                    size: 24,
                  ),
                ),
                label: 'Search',
              ),
              NavigationDestination(
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
        ],
      ),
    );
  }
}
