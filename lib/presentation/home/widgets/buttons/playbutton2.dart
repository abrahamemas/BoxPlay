import 'package:flutter/material.dart';

class PlayButton2 extends StatelessWidget {
  final double height;
  final double size;

  const PlayButton2({Key? key, required this.height, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 42,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: Transform.translate(
              offset: Offset(0, -4),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow_sharp,
                  size: size,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
