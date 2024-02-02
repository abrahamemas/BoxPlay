import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  const Popup({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 230, top: 5),
          child: Column(
            children: [
              PopupMenuButton<String>(
                iconColor: Theme.of(context).primaryColor,
                color: Colors.white,
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
