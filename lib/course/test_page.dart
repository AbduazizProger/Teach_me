import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teach_me/main/pages/home.dart';
import 'package:teach_me/models/preferences.dart';
import 'package:teach_me/models/question.dart';
import 'package:http/http.dart' as http;

Future<List<Question>> fetchQuestions(String courseName, int index) async {
  final response = await http.get(
    Uri.parse(
      'http://$initialUrl/$courseName/lessons/${courseName}1/question',
    ),
  );
  print('http://$initialUrl/$courseName/lessons/${courseName}1/question');
  if (response.statusCode == 200) {
    List<Question> questions = [];
    final data = jsonDecode(response.body)[index - 1];
    questions.add(Question.fromJson(data));
    return questions;
  } else {
    throw Exception('Failed to load tests');
  }
}

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
    required this.id,
    required this.index,
    required this.courseName,
  });
  final int id;
  final int index;
  final String courseName;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int shouldShow = 0;
  @override
  Widget build(BuildContext context) {
    final prefs = PreferencesProvider.of(context)!.data;
    return FutureBuilder(
        future: fetchQuestions(widget.courseName, widget.index),
        initialData: [
          Question.fromJson(
            jsonDecode("""
                [
    {
        "title": "Question",
        "answer": [
            {
                "id": 1,
                "answer_text": "some",
                "is_right": false
            },
            {
                "id": 2,
                "answer_text": "some1",
                "is_right": false
            },
            {
                "id": 3,
                "answer_text": "some2",
                "is_right": true
            }
        ]
    }
]
              """)[0],
          ),
        ],
        builder: (context, snapshot) {
          final List<Question> questions = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Test',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 25,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              leading: IconButton(
                icon: Transform.rotate(
                  angle: -3.14 / 2,
                  child: const Icon(
                    CupertinoIcons.triangle_fill,
                    color: Colors.amber,
                    size: 35,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      Text(
                        questions[0].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(
                                    questions[0].answers[0].answerText,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 80),
                                  IconButton(
                                    onPressed: () {
                                      if (questions[0].answers[0].isRight) {
                                        shouldShow = 1;
                                        prefs.setBool(
                                          '${widget.courseName}${widget.id}',
                                          true,
                                        );
                                      } else {
                                        shouldShow = 2;
                                      }
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(
                                    questions[0].answers[1].answerText,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 80),
                                  IconButton(
                                    onPressed: () {
                                      if (questions[0].answers[1].isRight) {
                                        shouldShow = 1;
                                        prefs.setBool(
                                          '${widget.courseName}${widget.id}',
                                          true,
                                        );
                                      } else {
                                        shouldShow = 2;
                                      }
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Text(
                                    questions[0].answers[2].answerText,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 80),
                                  IconButton(
                                    onPressed: () {
                                      if (questions[0].answers[2].isRight) {
                                        shouldShow = 1;
                                        prefs.setBool(
                                          '${widget.courseName}${widget.id}',
                                          true,
                                        );
                                      } else {
                                        shouldShow = 2;
                                      }
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                shouldShow != 0
                    ? Container(
                        color: const Color.fromARGB(150, 0, 0, 0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              shouldShow == 1
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 60,
                                    )
                                  : shouldShow == 2
                                      ? const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: 60,
                                        )
                                      : const SizedBox(),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  if (shouldShow == 1) {
                                    Navigator.of(context).pop();
                                  } else {
                                    setState(() {
                                      shouldShow = 0;
                                    });
                                  }
                                },
                                child: const Text(
                                  'ok',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        });
  }
}
