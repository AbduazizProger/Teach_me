import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teach_me/about/about_page.dart';
import 'package:teach_me/main/main_page.dart';
import 'package:teach_me/models/preferences.dart';
import 'package:teach_me/register/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(prefs: prefs),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return PreferencesProvider(
      data: prefs,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          useMaterial3: true,
        ),
        routes: {
          '/about': (context) => AboutPage(),
          '/login': (context) => const RegisterPage(),
          '/main': (context) => const MainPage(),
        },
        initialRoute: prefs.getString('username') != null ? '/main' : '/about',
      ),
    );
  }
}
