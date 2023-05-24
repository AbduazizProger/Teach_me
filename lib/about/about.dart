import 'package:flutter/material.dart';
import 'package:teach_me/register/components/texts.dart';

class About extends StatelessWidget {
  const About({super.key});

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
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: const Texts(),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 7, color: Colors.amber),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 7, color: Colors.white),
                  SizedBox(width: 10),
                  Icon(Icons.circle, size: 7, color: Colors.white),
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
