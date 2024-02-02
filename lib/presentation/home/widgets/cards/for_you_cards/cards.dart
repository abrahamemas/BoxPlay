import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class CardScreen extends StatelessWidget {
  final String smallText;
  final String text;

  final String image;
  const CardScreen(
      {super.key,
      required this.image,
      required this.text,
      required this.smallText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).hoverColor,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      smallText,
                      style: TextStyles.text3(context),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyles.bigtext1(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
