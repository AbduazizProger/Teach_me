import 'package:flutter/material.dart';
import 'package:teach_me/course/video_page.dart';
import 'package:teach_me/course/youtube_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.widget,
    required this.index,
  });

  final VideoPage widget;
  final int index;

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
                YoutubePlayer.getThumbnail(
                  videoId: YoutubePlayer.convertUrlToId(videos[0].urls[index])!,
                ),
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
  }
}
