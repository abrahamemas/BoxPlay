import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:lottie/lottie.dart';
// ignore: unused_import
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:music_app/presentation/home/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Center(
          child: SizedBox(
            child: Stack(
              children: [
                FlutterSplashScreen(
                useImmersiveMode: true,
                        duration:  Duration(seconds: 2),
                        nextScreen: const HomeScreen(),
                        backgroundColor: Colors.black,
                        splashScreenBody: Center(
                child: Lottie.asset(
                  "assets/lottie_img1.json",
                  repeat: false,
                ),
    
                ),
                ),
                
              ],
            )
             ),
        ),
      ),

    );
  }
}