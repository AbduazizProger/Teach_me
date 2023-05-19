import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teach_me/main/components/best_one.dart';
import 'package:teach_me/main/components/courses.dart';
import 'package:teach_me/main/components/enrolled_courses.dart';
import 'package:teach_me/models/course.dart';
import 'package:http/http.dart' as http;

const String initialUrl = 'teachme-production.up.railway.app';

Future<List<Course>> fetchCourses() async {
  final response = await http.get(Uri.parse('http://$initialUrl'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<Course> courses = [];
    for (var el in data) {
      courses.add(Course.fromJson(el));
    }
    return courses;
  } else {
    throw Exception('Failed to load courses');
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCourses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Course> courses = snapshot.data!;
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
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
