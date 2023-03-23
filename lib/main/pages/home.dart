import 'package:flutter/material.dart';
import 'package:teach_me/main/courses.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Courses',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 27,
                shadows: [
                  Shadow(
                    blurRadius: 35,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
        ),
        Courses(),
      ],
    );
  }
}
