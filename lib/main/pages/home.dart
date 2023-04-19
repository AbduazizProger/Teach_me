import 'package:flutter/material.dart';
import 'package:teach_me/main/components/best_one.dart';
import 'package:teach_me/main/components/courses.dart';
import 'package:teach_me/main/components/enrolled_courses.dart';
import 'package:teach_me/models/course.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Course> courses = [
    Course('Python',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Python.svg/800px-Python.svg.png'),
    Course('Java', 'https://proxys.io/files/blog/Java/javalogo.png'),
    Course('Dart',
        'https://upload.wikimedia.org/wikipedia/commons/c/c6/Dart_logo.png'),
    Course('Java Script',
        'https://a.thumbs.redditmedia.com/zDOFJTXd6fmlD58VDGypiV94Leflz11woxmgbGY6p_4.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return BestCourse(courses: courses);
        } else if (index == 1) {
          return CoursesAll(courses: courses);
        } else {
          return EnrolledCourses(courses: courses, index: index);
        }
      },
    );
  }
}
