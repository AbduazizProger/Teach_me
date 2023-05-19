import 'package:flutter/material.dart';
import 'package:teach_me/course/all_stories_page.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/own/slight_left.dart';

class CourseOverview extends StatelessWidget {
  const CourseOverview({
    super.key,
    required this.courses,
    required this.id,
  });

  final List<Course> courses;
  final int id;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(0, 255, 209, 1),
              width: 4,
            ),
          ),
          child: Image.network(
            courses[id].imageUrl,
            width: 150,
            height: 150,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            shadows: [
              Shadow(
                blurRadius: 35,
                color: Colors.black,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: SizedBox(
            width: 150,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  SlideLeftRoute(
                    builder: (_) => AllStoriesPage(name: courses[id].name),
                    settings: const RouteSettings(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: const BorderSide(
                  color: Color.fromRGBO(0, 255, 209, 1),
                  style: BorderStyle.solid,
                  width: 4,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 9),
                child: Text(
                  'Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
