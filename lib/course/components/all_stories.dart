import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teach_me/course/story_telling_page.dart';
import 'package:teach_me/main/pages/home.dart';
import 'package:teach_me/models/preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<List<String>> getStories(String courseName) async {
  final url = Uri.parse('http://$initialUrl/$courseName/stories');
  print('http://$initialUrl/$courseName/stories');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<String> urls = [];
      for (var item in jsonData) {
        final url = item['story_post_video'] as String;
        urls.add(url);
      }
      return urls;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

class AllStoriesWidget extends StatelessWidget {
  const AllStoriesWidget({
    Key? key,
    required this.courseName,
  }) : super(key: key);

  final courseName;

  @override
  Widget build(BuildContext context) {
    final prefs = PreferencesProvider.of(context)!.data;
    return FutureBuilder<List<String>>(
      future: getStories(courseName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<String> stories = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) {
                bool? isFinished = prefs.getBool('$courseName$index');
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StoryTellingPage(
                          id: index,
                          courseName: courseName,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            spreadRadius: 25,
                            blurStyle: BlurStyle.solid,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                YoutubePlayer.getThumbnail(
                                    videoId: YoutubePlayer.convertUrlToId(
                                            stories[index]) ??
                                        ''),
                                width: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 35.0),
                                child: Text(
                                  '${index + 1} th lesson',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          isFinished == null
                              ? const SizedBox()
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 120),
                                    Container(
                                      height: 5,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
