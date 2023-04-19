import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/course/video_page.dart';
import 'package:teach_me/own/slight_left.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
