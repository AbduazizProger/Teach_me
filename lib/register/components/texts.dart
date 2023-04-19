import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  const Texts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: const [
              Text(
                'About project',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(0, 255, 209, 1),
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 25,
                      color: Color.fromRGBO(0, 255, 209, 1),
                    ),
                  ],
                ),
              ),
              Text(
                'About project',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  blurRadius: 15,
                  color: Color.fromRGBO(0, 255, 209, 1),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
