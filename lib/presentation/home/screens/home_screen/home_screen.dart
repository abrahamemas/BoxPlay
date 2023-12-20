import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/presentation/home/screens/tabs/for_you.dart';
import 'package:music_app/presentation/home/screens/tabs/relax.dart';
import 'package:music_app/presentation/home/screens/tabs/workout.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/presentation/home/widgets/url_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String _greeting = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _updateGreeting();
    _tabController = TabController(length: 5, vsync: this);
  }

  void _updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      _greeting = 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      _greeting = 'Good Afternoon';
    } else {
      _greeting = 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: false,
              pinned: true,
              title: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyles.text(context),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          _greeting,
                          style: TextStyles.medium(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 280, top: 55),
                    child: IconButton(
      onPressed: () {
      },
      icon: const Icon(
        Icons.notifications,
        size: 26,
        color: Color.fromARGB(70, 255, 255, 255), 
      ),
    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 298, top: 20),
                    child: ClipOval(
                      child: Lottie.asset(
                        width: 120,
                        height: 120,
                        "assets/lottie_img2.json",
                        repeat: false,
                      ),
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80), 
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                   margin: EdgeInsets.all(10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).hoverColor,
                      ),
                      tabs: [
                        Tab(child: Text('For you', style: TextStyles.text2(context))),
                        Tab(child: Text('Relax', style: TextStyles.text2(context))),
                        Tab(child: Text('Workout', style: TextStyles.text2(context))),
                        Tab(child: Text('Travel', style: TextStyles.text2(context))),
                        Tab(child: Text('Energize', style: TextStyles.text2(context))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Tab(child: For_You()),
            Tab(child: RelaxScreen()),
            Tab(child: WorkoutScreen()),
            Tab(child: Text('Travel', style: TextStyles.text2(context))),
            Tab(child: Text('Energize', style: TextStyles.text2(context))),
          ],
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Color(0x000000).withOpacity(0.5),
  unselectedItemColor: Theme.of(context).primaryColor ,
  selectedItemColor: Theme.of(context).primaryColor,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  items: [
    BottomNavigationBarItem(
      icon: UrlPath(UrlPath1: 'assets/home2.svg',
      size:24,
      ),
      label: 'Home',
      

    ),
    BottomNavigationBarItem(
     icon: UrlPath(UrlPath1: 'assets/search.svg',
      size:24,
      ),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: UrlPath(UrlPath1: 'assets/library_music.svg',
      size:24,
      ),
      label: 'Your Library',
    ),
  ],
),

    );
  }
}
