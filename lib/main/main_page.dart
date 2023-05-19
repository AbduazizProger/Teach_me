import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/main/pages/home.dart';
import 'package:teach_me/main/pages/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  Widget? whichPage(int index) {
    if (index == 0) {
      return const HomePage();
    } else {
      return const ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/teachme.png'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: whichPage(currentPage),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, size: 25),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person, size: 25),
                label: 'Profile',
              ),
            ],
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
          ),
        ),
      ],
    );
  }
}
