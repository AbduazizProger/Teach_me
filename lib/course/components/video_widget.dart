import 'package:flutter/material.dart';
import 'package:teach_me/course/video_page.dart';
import 'package:teach_me/course/youtube_page.dart';
import 'package:teach_me/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.widget,
    required this.index,
    required this.video,
  });

  final VideoPage widget;
  final int index;
  final Video video;

  @override
  Widget build(BuildContext context) {
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
                    id: widget.index,
                    video: video,
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
                YoutubePlayer.getThumbnail(
                  videoId: YoutubePlayer.convertUrlToId(video.urls[index])!,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            video.names[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
