import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 30),
          child: Text(
            'Today’s Refreshing Song-Recommendations',
            style: TextStyles.bigtext(context),
          ),
        ),
      ],

    );
  }
}
