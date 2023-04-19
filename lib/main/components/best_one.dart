import 'package:flutter/material.dart';
import 'package:teach_me/course/course_page.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/own/slight_left.dart';

class BestCourse extends StatelessWidget {
  const BestCourse({
    super.key,
    required this.courses,
  });

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            SlideLeftRoute(
              builder: (_) => CoursePage(id: 0, courses: courses),
              settings: const RouteSettings(),
            ),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Center(
                child: Image(image: NetworkImage(courses[0].imageUrl)),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'The best one',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
