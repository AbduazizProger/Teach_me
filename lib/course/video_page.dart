import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/components/video_widget.dart';
import 'package:teach_me/course/test_page.dart';
import 'package:teach_me/models/video.dart';
import 'package:teach_me/own/slight_left.dart';
import 'package:http/http.dart' as http;

Future<List<Video>> fetchCourses(String courseName, int index) async {
  final response = await http.get(
    Uri.parse(
      'http://192.168.0.101:8000/$courseName/lessons/$courseName$index/',
    ),
  );
  print('http://192.168.0.101:8000/$courseName/lessons/$courseName$index/');
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<Video> videos = [];
    for (var el in data) {
      videos.add(Video.fromJson(el));
    }
    return videos;
  } else {
    throw Exception('Failed to load videos');
  }
}

class VideoPage extends StatefulWidget {
  const VideoPage({super.key, required this.index, required this.courseName});
  final int index;
  final String courseName;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
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
          FutureBuilder(
            future: fetchCourses(widget.courseName, widget.index),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Video> videos = snapshot.data!;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      videos[0].title,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 30,
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
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            SlideLeftRoute(
                              builder: (_) => const TestPage(id: 0),
                              settings: const RouteSettings(),
                            ),
                          );
                        },
                        icon: Transform.rotate(
                          angle: 3.14 / 2,
                          child: const Icon(
                            CupertinoIcons.triangle_fill,
                            color: Colors.amber,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                  ),
                  backgroundColor: Colors.transparent,
                  body: ListView.builder(
                    itemCount: videos[0].urls.length,
                    itemBuilder: (context, index) {
                      return VideoWidget(
                        widget: widget,
                        index: index,
                        video: videos[0],
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
