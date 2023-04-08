import 'package:flutter/material.dart';

class WhatGet extends StatelessWidget {
  const WhatGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(height: 300),
              Container(
                height: 243,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'What you will get',
                          style: TextStyle(
                            fontSize: 30,
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
                    ),
                    Text(
                      "You will get some, some ,some, some, some things and bla bla bla bla.",
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
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.circle, size: 7, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 7, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 7, color: Colors.amber),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
