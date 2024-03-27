import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class CardScreen3 extends StatelessWidget {
  final String text;
  final String smalltext;
  final Icon button;

  const CardScreen3({
    super.key,
    required this.text,
    required this.smalltext,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 148,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).hoverColor,
              Theme.of(context).scaffoldBackgroundColor,
            ],
            begin: Alignment(0.0, -3.0),
            end: Alignment(0.0, 1.0),
          )),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: button,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      text,
                      style: TextStyles.text5(context),
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: Offset(0, -6),
                    child: Text(
                      smalltext,
                      style: TextStyles.smalltext4(context),
                    ),
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
