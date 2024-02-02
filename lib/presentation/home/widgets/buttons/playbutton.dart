import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final double height;
  final double size;

  const PlayButton({Key? key, required this.height, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 42,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_sharp,
                size: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
