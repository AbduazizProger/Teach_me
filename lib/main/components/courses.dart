import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/course_page.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/own/slight_left.dart';

class CoursesAll extends StatelessWidget {
  const CoursesAll({
    super.key,
    required this.courses,
  });

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Courses',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 35,
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
        Courses(courses: courses),
        const SizedBox(height: 20),
        const Text(
          'Enrolled',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 35,
            shadows: [
              Shadow(
                blurRadius: 35,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Courses extends StatelessWidget {
  const Courses({super.key, required this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.5,
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
            builder: (_) => CoursePage(id: index, courses: courses),
            settings: const RouteSettings(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(urlImage, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
