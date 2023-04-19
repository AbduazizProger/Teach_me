import 'package:flutter/material.dart';
import 'package:teach_me/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage(
      {super.key, required this.index, required this.id, required this.video});

  final int index;
  final int id;
  final Video video;

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  List<YoutubePlayerController> controllers = [];
  @override
  void initState() {
    for (int i = 0; i < widget.video.urls.length; i++) {
      widget.video.urls[i] =
          YoutubePlayer.convertUrlToId(widget.video.urls[i])!;
      controllers.add(
        YoutubePlayerController(
          initialVideoId: widget.video.urls[i],
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            disableDragSeek: true,
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
