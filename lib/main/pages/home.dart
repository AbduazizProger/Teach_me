import 'package:flutter/material.dart';
import 'package:teach_me/course/course_page.dart';
import 'package:teach_me/main/courses.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/own/slight_left.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Course> courses = [
    Course(1, 'Python',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Python.svg/800px-Python.svg.png'),
    Course(2, 'Java', 'https://proxys.io/files/blog/Java/javalogo.png'),
    Course(3, 'Dart',
        'https://upload.wikimedia.org/wikipedia/commons/c/c6/Dart_logo.png'),
    Course(4, 'Java Script',
        'https://a.thumbs.redditmedia.com/zDOFJTXd6fmlD58VDGypiV94Leflz11woxmgbGY6p_4.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  SlideLeftRoute(
                    builder: (_) => const CoursePage(id: 0),
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
        } else if (index == 1) {
          return Column(
            children: const [
              Padding(
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
              Courses(),
              SizedBox(height: 20),
              Text(
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
        } else {
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
                      const Text(
                        'Lorem ipsum lorem ipsum\nlorem ipsum lorem ipsum\nlorem ipsum lorem \nipsum lorem \nipsum lorem ipsum',
                        maxLines: 5,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            SlideLeftRoute(
                              builder: (_) => CoursePage(id: index - 2),
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
      },
    );
  }
}
