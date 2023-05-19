import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/about/about.dart';
import 'package:teach_me/about/purpose.dart';
import 'package:teach_me/about/what_get.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  static const List<Widget> abouts = [
    About(),
    Purpose(),
    WhatGet(),
  ];
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PageView.builder(
          controller: _controller,
          itemCount: abouts.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                abouts[index],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != 0
                          ? Transform.rotate(
                              angle: 3.14 / -2,
                              child: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.triangle_fill,
                                  color: Colors.yellow,
                                ),
                                onPressed: () {
                                  _controller.previousPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOutBack,
                                  );
                                },
                              ),
                            )
                          : const Icon(Icons.abc, color: Colors.black),
                      Transform.rotate(
                        angle: 3.14 / 2,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.triangle_fill,
                            color: Colors.yellow,
                          ),
                          onPressed: () {
                            if (index != 2) {
                              _controller.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOutBack,
                              );
                            } else {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          pageSnapping: true,
        ),
      ),
    );
  }
}
