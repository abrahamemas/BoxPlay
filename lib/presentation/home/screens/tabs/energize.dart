import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/presentation/home/widgets/cards/energize_list/energize_list.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class EnergizeScreen extends StatelessWidget {
  const EnergizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 210, top: 10),
                child: Text(
                  'START RADIO FROM A SONG',
                  style: TextStyles.smalltext(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 245, top: 8),
                child: Text(
                  'Quick picks',
                  style: TextStyles.bigtext(context),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25),
                  child: EnergizeListScreen(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 320, top: 23),
          child: Container(
            height: 32,
            width: 64,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Transform.translate(
                    offset: Offset(0, -1),
                    child: Text(
                      'Playall',
                      style: TextStyle(color: Theme.of(context).hoverColor),
                    ))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18, top: 460),
          child: Text(
            'MORE FROM DAVIDO',
            style: TextStyles.smalltext(context),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 18, top: 480),
          child: Text(
            'DAVIDO',
            style: TextStyles.bigtext(context),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 320, top: 465),
          child: Container(
            height: 32,
            width: 64,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Transform.translate(
                    offset: Offset(0, -1),
                    child: Text(
                      'More',
                      style: TextStyle(color: Theme.of(context).hoverColor),
                    ))),
          ),
        ),
      ],
    );
  }
}
