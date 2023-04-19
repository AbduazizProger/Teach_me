import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/components/course_overview.dart';
import 'package:teach_me/models/course.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key, required this.id, required this.courses});
  final int id;
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 10) {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
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
                courses[id].name,
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
            body: CourseOverview(courses: courses, id: id),
          ),
        ],
      ),
    );
  }
}
