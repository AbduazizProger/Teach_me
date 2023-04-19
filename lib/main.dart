import 'package:flutter/material.dart';
import 'package:teach_me/about/about_page.dart';
import 'package:teach_me/main/main_page.dart';
import 'package:teach_me/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      routes: {
        '/about': (context) => AboutPage(),
        '/login': (context) => RegisterPage(),
        '/main': (context) => MainPage(),
      },
      initialRoute: '/about',
    );
  }
}
