import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/components/all_stories.dart';

class AllStoriesPage extends StatelessWidget {
  const AllStoriesPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              name,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 25,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: Transform.rotate(
                angle: -3.14 / 2,
                child: const Icon(
                  CupertinoIcons.triangle_fill,
                  color: Colors.amber,
                  size: 35,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onHorizontalDragStart: (details) {
              Navigator.of(context).pop();
            },
            child: AllStoriesWidget(courseName: name),
          ),
        ),
      ],
    );
  }
}
