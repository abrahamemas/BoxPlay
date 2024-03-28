import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:music_app/presentation/home/screens/tabs/energize.dart';
import 'package:music_app/presentation/home/screens/tabs/for_you.dart';
import 'package:music_app/presentation/home/screens/tabs/relax.dart';
import 'package:music_app/presentation/home/screens/tabs/sad.dart';
import 'package:music_app/presentation/home/screens/tabs/workout.dart';
import 'package:music_app/presentation/home/widgets/buttons/buttom_nav_bar.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();
  }

  File? image;

  Future<void> pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage == null) {
        print('No image picked');
        return;
      }

      final imageTemporary = File(pickedImage.path);
      setState(() {
        image = imageTemporary;
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
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
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome,',
                            style: TextStyles.text(context),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            _greeting,
                            style: TextStyles.medium(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 100,
                      ),
                      child: Transform.translate(
                        offset: Offset(20, -20),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none_outlined,
                            size: 28,
                            color: Color.fromARGB(70, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Transform.translate(
                        offset: Offset(30, -20),
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: image != null
                                  ? Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset('assets/image15.jpg',
                                      fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(58),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25)),
                  child: TabBar(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    dividerColor: Theme.of(context).scaffoldBackgroundColor,
                    labelPadding: EdgeInsets.symmetric(horizontal: 4),
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorWeight: 2.0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).hoverColor,
                    ),
                    tabs: [
                      Tab(
                          child: Text('For you',
                              style: TextStyles.text2(context))),
                      Tab(
                          child:
                              Text('Relax', style: TextStyles.text2(context))),
                      Tab(
                          child: Text('Workout',
                              style: TextStyles.text2(context))),
                      Tab(child: Text('Sad', style: TextStyles.text2(context))),
                      Tab(
                          child: Text('Energize',
                              style: TextStyles.text2(context))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 744,
                      child: TabBarView(
                        children: [
                          For_You(),
                          RelaxScreen(),
                          WorkoutScreen(),
                          SadScreen(),
                          EnergizeScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: ButtomNavBar(),
        ),
      ),
    );
  }
}
