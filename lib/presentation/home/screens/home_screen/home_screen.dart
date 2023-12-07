import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/presentation/home/widgets/Tabbar.dart';
import 'package:music_app/presentation/home/widgets/alignment.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/presentation/home/widgets/url_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: 
       Stack(
          children: [
            Row(
              children: [
                Placement(
                  translateX: 24,
                  translateY: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,   
                    children: [
                      Text(
                        'Welcome,',
                        style: TextStyles.text(context),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        _greeting,
                        style: TextStyles.medieum(context),
                      ),

                     
                    ],
                  ),
                ),
                SizedBox(width: 40,),
                Placement(
                  translateX: 120,
                  translateY: -350,
                  child: UrlPath(UrlPath1: 'assets/bell.svg')
                ),
                 SizedBox(width: 40,),
                 Placement(
                   translateY: -350,
                   translateX: 60,
                   child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                      
                    ),
                    child: ClipOval(
                      child: Lottie.asset(
                    "assets/lottie_img2.json",
                    repeat: false,
                                 ),
                    ),
                   ),
                 )
              ],
            ),
            

                       Placement(translateX: 10,
                       translateY:125,
                       child: TabbarScreen()),
                
              
            
          ],
        ),
      
    );
  }
}
