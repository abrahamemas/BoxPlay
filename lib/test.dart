import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text('TabBar without Indicator'),
            bottom: TabBar(
              // Customize the indicator to remove the line
              indicator: BoxDecoration(),
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: TabBarView(
            children: [
              // Your tab views go here
              Text('Tab 1 content'),
              Text('Tab 2 content'),
              Text('Tab 3 content'),
            ],
          ),
        ),
      ),
    );
  }
}
