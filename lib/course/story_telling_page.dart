import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            children: [
              ClipRect(
                child: SizedBox(
                  height: 368,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/images/softman.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 368,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.rotate(
                        angle: 3.14 / 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              SlideLeftRoute(
                                builder: (_) => const VideoPage(id: 0),
                                settings: const RouteSettings(),
                              ),
                            );
                          },
                          child: const Icon(
                            CupertinoIcons.triangle,
                            color: Colors.blue,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
