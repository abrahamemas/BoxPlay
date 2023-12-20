import 'package:flutter/material.dart';

class IconButtonPlay extends StatelessWidget {
  final double height;
  final double size;
  const IconButtonPlay({super.key, required this.height, required this.size});

  @override
  Widget build(BuildContext context) {
    return  Padding(
             padding: const EdgeInsets.only(top: 42,),
              child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15,right: 25),
                  child: Container(
                     height: height,
                       decoration: BoxDecoration(
                       shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                        ),
                    child: Transform.translate(
                      offset: Offset(0, -4),
                      child: IconButton(
                      onPressed: () {
                        
                      },
                       
                         icon:  Icon(            
                             Icons.play_arrow_sharp,
                               size: size,
                                      ),
                                    ),
                    ),
                  ),
                ),
                            ],
                          ),
                        );
  }
}