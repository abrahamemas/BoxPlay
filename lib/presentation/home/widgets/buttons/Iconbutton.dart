import 'package:flutter/material.dart';

class IconButtonPlay extends StatelessWidget {
  const IconButtonPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
             padding: const EdgeInsets.only(top: 42,),
              child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                onPressed: () {},
                 color: Theme.of(context).primaryColor,
                   icon: const Icon(            
                       Icons.play_circle_fill,
                         size: 24,
                                ),
                              ),
                            ],
                          ),
                        );
  }
}