
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Popup2 extends StatelessWidget {
  const Popup2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.separated(
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) { 
             return 
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                          
                              PopupMenuButton<String>(
                               
                               color: Theme.of(context).primaryColor,
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
                                       )
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
         },                               separatorBuilder: (context, _) => const SizedBox(height: 30),
         
       
    
      ),
    );
  }
}