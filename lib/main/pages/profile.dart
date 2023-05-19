import 'package:flutter/material.dart';
import 'package:teach_me/course/components/all_stories.dart';
import 'package:teach_me/main/pages/home.dart';
import 'package:teach_me/models/course.dart';
import 'package:teach_me/models/preferences.dart';

Future<List<dynamic>> fetches() async {
  final courses = await fetchCourses();
  List<List<String>> course_names = [];
  List<int> stories_num = [];
  for (int i = 0; i < courses.length; i++) {
    course_names.add(await getStories(courses[i].name));
    stories_num.add(course_names[i].length);
  }
  return [courses, stories_num];
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final prefs = PreferencesProvider.of(context)!.data;
    return FutureBuilder(
      future: fetches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final courses = snapshot.data![0] as List<Course>;
          final stories_num = snapshot.data![1] as List<int>;
          return ListView.builder(
            itemCount: courses.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 200,
                        child: const Image(
                          image: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                          ),
                        ),
                      ),
                      Text(
                        prefs.getString('username')!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (index == 1) {
                return const SizedBox(height: 20);
              } else {
                int watched = 0;
                for (int i = 0; i < stories_num.length; i++) {
                  final isWatched =
                      prefs.getBool('${courses[i].name}$i') ?? false;
                  if (isWatched) {
                    watched++;
                  }
                }
                return watched != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            courses[index - 2].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox();
              }
            },
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
