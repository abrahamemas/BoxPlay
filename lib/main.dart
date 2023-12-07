import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/widgets/cards/smallcards.dart';
// ignore: unused_import
import 'presentation/home/screens/home_screen/home_screen.dart';
// ignore: unused_import
import 'presentation/home/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: MusicApp()));
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MusicApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0D0D0D),
        primaryColor: Color(0xBFFFFFFF),
        hintColor: Color(0x80FFFFFF),
        hoverColor: Color(0xff1F1F1F)
      ),
      home: HomeScreen(),
    );
    
  }
}