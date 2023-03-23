import 'package:flutter/material.dart';
import 'package:teach_me/course/video_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({super.key, required this.index, required this.id});

  final int index;
  final int id;

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  List<YoutubePlayerController> controllers = [];
  @override
  void initState() {
    for (int i = 0; i < videos[widget.id].urls.length; i++) {
      videos[widget.id].urls[i] =
          YoutubePlayer.convertUrlToId(videos[widget.id].urls[i])!;

      controllers.add(
        YoutubePlayerController(
          initialVideoId: videos[widget.id].urls[i],
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controllers[widget.index],
            showVideoProgressIndicator: true,
          ),
          builder: (BuildContext context, Widget player) {
            return player;
          },
        ),
      ),
    );
  }
}
