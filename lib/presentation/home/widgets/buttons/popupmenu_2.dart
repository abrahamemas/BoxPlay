import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Popup2 extends StatelessWidget {
  const Popup2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 280, top: 35),
          child: Column(
            children: [
              PopupMenuButton<String>(
                color: Colors.white,
                iconColor: Theme.of(context).primaryColor,
                onSelected: (value) {
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'add to playlist',
                      child: Text(
                        'Add to playlist',
                        style: TextStyle(
                          color: Theme.of(context).hoverColor,
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'remove',
                      child: Text('Remove'),
                    ),
                    PopupMenuItem<String>(
                      value: 'download',
                      child: Text('Download'),
                    ),
                  ];
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
