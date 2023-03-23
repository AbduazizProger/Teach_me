import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.id});
  final int id;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    List<bool> isChecked = [
      false,
      false,
      false,
    ];
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              '1.Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Column(
              children: [
                RadioListTile(
                  title: const Text(
                    "Something 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  value: "male",
                  groupValue: true,
                  selected: isChecked[0],
                  onChanged: (value) {
                    setState(() {
                      isChecked[0] = true;
                      isChecked[1] = false;
                      isChecked[2] = false;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    "Something 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  value: "female",
                  groupValue: true,
                  selected: isChecked[1],
                  onChanged: (value) {
                    setState(() {
                      isChecked[0] = false;
                      isChecked[1] = true;
                      isChecked[2] = false;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text(
                    "Something 3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  value: "other",
                  groupValue: true,
                  selected: isChecked[2],
                  onChanged: (value) {
                    setState(() {
                      isChecked[0] = false;
                      isChecked[1] = false;
                      isChecked[2] = true;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
