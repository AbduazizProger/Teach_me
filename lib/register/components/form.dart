import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_me/main/main_page.dart';
import 'package:teach_me/own/slight_left.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Column(
      children: [
        SizedBox(
          width: 330,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: username,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person, size: 50),
                fillColor: Colors.white,
                filled: true,
                labelText: ' Username',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 330,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.lock, size: 50),
                fillColor: Colors.white,
                filled: true,
                labelText: 'Password',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (username.text != '' && password.text != '') {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString('username', username.text);
                  prefs.setString('password', password.text);
                  Navigator.of(context).pushReplacement(
                    SlideLeftRoute(
                      builder: (_) => const MainPage(),
                      settings: const RouteSettings(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: const BorderSide(
                  color: Color.fromRGBO(0, 255, 209, 1),
                  style: BorderStyle.solid,
                  width: 4,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: const BorderSide(
                  color: Color.fromRGBO(0, 255, 209, 1),
                  style: BorderStyle.solid,
                  width: 4,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Create account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
