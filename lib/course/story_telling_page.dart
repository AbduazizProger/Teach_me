import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_me/course/components/skip_button.dart';
import 'package:teach_me/course/components/story_widget.dart';
import 'package:teach_me/course/video_page.dart';
import 'package:teach_me/own/slight_left.dart';

class StoryTellingPage extends StatefulWidget {
  const StoryTellingPage({super.key, required this.id});
  final int id;

  @override
  State<StoryTellingPage> createState() => _StoryTellingPageState();
}

class _StoryTellingPageState extends State<StoryTellingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: const [
              ClipRect(
                child: StoryWidget(),
              ),
              SkipButton(),
            ],
          ),
        ],
      ),
    );
  }
}
