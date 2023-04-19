import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 200,
                child: const Image(
                  image: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                  ),
                ),
              ),
              const Text(
                'Profile name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Bla bla bla bla Bla bla bla bla Bla bla bla bla Bla bla bla bla Bla bla bla bla Bla bla bla bla Bla bla bla bla',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
