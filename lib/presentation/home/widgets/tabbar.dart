import 'package:flutter/material.dart';
import 'package:music_app/presentation/home/screens/tabs/for_you.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 6, vsync: this,);
    return DefaultTabController(

      length: 6,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor
            ),
            
              child: TabBar(
                controller: _tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 25),
                  indicator: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).hoverColor
                  ),
                tabs: [
                    Tab(child: Text('For you', style: TextStyles.text2(context))),
                    Tab(child: Text('Relax', style: TextStyles.text2(context))),
                    Tab(child: Text('Workout', style: TextStyles.text2(context))),
                    Tab(child: Text('Travel', style: TextStyles.text2(context))),
                    Tab(child: Text('Energize', style: TextStyles.text2(context))),
                    Tab(child: Text('Focus', style: TextStyles.text2(context))),
            
            
              ]),
            
    
          ),
          
             Container(
              child:  Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                     Tab(child: For_You()),
                      Tab(child: Text('Energize', style: TextStyles.text2(context))),
                      Tab(child: Text('Focus', style: TextStyles.text2(context))),
                      Tab(child: Text('Travel', style: TextStyles.text2(context))),
                      Tab(child: Text('Energize', style: TextStyles.text2(context))),
                      Tab(child: Text('Focus', style: TextStyles.text2(context))),
                  ]),
              ),
            ),
          
        ],
      ),
    );
  }
}