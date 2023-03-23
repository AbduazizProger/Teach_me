import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/course_page.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/own/slight_left.dart';

List<Course> courses = [
  Course(1, 'Python',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Python.svg/800px-Python.svg.png'),
  Course(2, 'Java', 'https://proxys.io/files/blog/Java/javalogo.png'),
  Course(3, 'Dart',
      'https://upload.wikimedia.org/wikipedia/commons/c/c6/Dart_logo.png'),
  Course(4, 'Java Script',
      'https://a.thumbs.redditmedia.com/zDOFJTXd6fmlD58VDGypiV94Leflz11woxmgbGY6p_4.png'),
];

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.4,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemCount: courses.length,
      itemBuilder: (context, index, realindex) {
        return buildImage(courses[index].imageUrl, index, context);
      },
    );
  }

  Widget buildImage(String urlImage, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          SlideLeftRoute(
            builder: (_) => CoursePage(id: index),
            settings: const RouteSettings(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.network(urlImage, fit: BoxFit.cover),
      ),
    );
  }
}
