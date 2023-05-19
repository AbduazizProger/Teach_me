import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teach_me/course/video_page.dart';
import 'package:teach_me/main/pages/home.dart';
import 'package:teach_me/own/slight_left.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

String fromJson(Map<String, dynamic> json) {
  return json['story_post_video'];
}

Future<String> fetchStory(String courseName, int index) async {
  final response = await http.get(
      Uri.parse('http://$initialUrl/$courseName/story/$courseName$index/'));
  print('http://$initialUrl/$courseName/story/$courseName$index/');
  if (response.statusCode == 200) {
    final data = fromJson(jsonDecode(response.body)[0] as Map<String, dynamic>);
    return data;
  } else {
    throw Exception('Failed to load courses');
  }
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
    required this.courseName,
    required this.index,
  });
  final String courseName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 368,
      child: FutureBuilder(
        future: fetchStory(courseName, index + 1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String video = snapshot.data!;
            return YoutubePlayerBuilder(
              player: YoutubePlayer(
                onEnded: (metaData) {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    SlideLeftRoute(
                      builder: (_) =>
                          VideoPage(index: index + 1, courseName: courseName),
                      settings: const RouteSettings(),
                    ),
                  );
                },
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(video)!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    disableDragSeek: true,
                    controlsVisibleAtStart: false,
                    hideControls: true,
                    endAt: 25,
                  ),
                ),
              ),
              builder: (BuildContext context, Widget player) {
                return player;
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
