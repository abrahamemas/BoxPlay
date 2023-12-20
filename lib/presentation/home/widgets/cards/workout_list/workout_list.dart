import 'package:flutter/widgets.dart';
import 'package:music_app/presentation/home/widgets/buttons/popupmenu.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(right: 30),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 308, 
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Popup(),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(width: 20),
    );
  }
}
