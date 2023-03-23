import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/test_page.dart';
import 'package:teach_me/course/youtube_page.dart';
import 'package:teach_me/models/video.dart';
import 'package:teach_me/own/slight_left.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

List<Video> videos = [
  Video(0, 'About computers', [
    "https://www.youtube.com/watch?v=tpIctyqH29Q",
    "https://www.youtube.com/watch?v=O5nskjZ_GoI",
    "https://www.youtube.com/watch?v=LN0ucKNX0hc",
  ]),
];

class VideoPage extends StatefulWidget {
  const VideoPage({super.key, required this.id});
  final int id;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              videos[widget.id].title,
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
            itemCount: videos[widget.id].urls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => YoutubePage(
                              index: index,
                              id: widget.id,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 220,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Image.network(
                          'https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Video name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
