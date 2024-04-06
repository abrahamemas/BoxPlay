import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/home/screens/splash_screen/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(ProviderScope(child: MusicApp()));
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
          );
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'MusicApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0D0D0D),
        primaryColor: Color(0xBFFFFFFF),
        hintColor: Color(0x80FFFFFF),
        hoverColor: Color(0xff1F1F1F),
      ),
      home: SplashScreen(),
    );
  }
}
