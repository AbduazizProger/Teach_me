import 'package:flutter/material.dart';
import 'package:teach_me/course/course_page.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/own/slight_left.dart';

class EnrolledCourses extends StatelessWidget {
  const EnrolledCourses({
    super.key,
    required this.courses,
    required this.index,
  });

  final List<Course> courses;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(courses[index - 2].imageUrl),
                    width: 160,
                  ),
                ),
                Text(
                  courses[index - 2].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 152,
                  child: ClipRect(
                    child: Text(
                      courses[index - 2].about,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      SlideLeftRoute(
                        builder: (_) =>
                            CoursePage(id: index - 2, courses: courses),
                        settings: const RouteSettings(),
                      ),
                    );
                  },
                  child: const Text('Countinue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
