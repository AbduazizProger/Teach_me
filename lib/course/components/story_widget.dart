import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 368,
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/softman.png'),
      ),
    );
  }
}
