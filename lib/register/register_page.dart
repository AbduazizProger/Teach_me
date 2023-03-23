import 'package:flutter/material.dart';
import 'package:teach_me/register/form.dart';
import 'package:teach_me/register/texts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/registration.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Registration',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 216, 97),
                fontSize: 35,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: const [
              SizedBox(height: 30),
              Texts(),
              SizedBox(height: 50),
              Forms(),
            ],
          ),
        ),
      ],
    );
  }
}
