import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/presentation/home/widgets/cards/sad_list/sad_list.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class SadScreen extends StatefulWidget {
  const SadScreen({super.key});

  @override
  State<SadScreen> createState() => _SadScreenState();
}

class _SadScreenState extends State<SadScreen> {
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
                                       padding: const EdgeInsets.only(left: 15,top: 15),
                                       child: SadListScreen(),
                                     ),
                      
                       ),
                        
                       
                
            ],
          ),
        ),
        Padding(     
              padding: EdgeInsets.only(left: 320,top: 30),
               child: Container(
                  height: 32,
                    width: 64,
                     child: ElevatedButton(
                      onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor , 
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18), 
                                ),
                              ),
                          child: Center(
                            child: Text(
                              'Playall',
                              style: TextStyle(
                                color:Theme.of(context).hoverColor
                              ),
                              ))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18, top: 380),
                      child: Text(
                        'MORE FROM BILLIE EILISH',
                        style: TextStyles.smalltext(context),
                      ),
                  ), 
          Padding(
                        padding: EdgeInsets.only(left: 18, top: 405),
                      child: Text(
                        'BILLIE EILISH',
                        style: TextStyles.bigtext(context),
                      ),
                  ),   


        Padding(     
              padding: EdgeInsets.only(left: 320,top: 405),
               child: Container(
                  height: 32,
                    width: 64,
                     child: ElevatedButton(
                      onPressed: (){}, 
                      style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor , 
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), 
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18), 
                                ),
                              ),
                          child: Center(
                            child: Text(
                              'More',
                              style: TextStyle(
                                color:Theme.of(context).hoverColor
                              ),
                              ))),
                        ),
                      ),
                 
                  
           

      ],
    );
  }
}