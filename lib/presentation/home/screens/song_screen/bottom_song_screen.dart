import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final bool isPlaying;
  final Function onTap;

  const BottomBar({super.key, required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isPlaying,
      child: isPlaying
          ? GestureDetector(
              onTap: () {
                onTap();
              },
              child: Container(
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text('Now Playing: Song Title'),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
