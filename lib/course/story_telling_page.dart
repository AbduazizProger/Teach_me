import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teach_me/course/components/skip_button.dart';
import 'package:teach_me/course/components/story_widget.dart';

class StoryTellingPage extends StatefulWidget {
  const StoryTellingPage(
      {super.key, required this.id, required this.courseName});
  final int id;
  final String courseName;

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
            children: [
              StoryWidget(courseName: widget.courseName, index: widget.id),
              SkipButton(courseName: widget.courseName, index: widget.id),
            ],
          ),
        ],
      ),
    );
  }
}
