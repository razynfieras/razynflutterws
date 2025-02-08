import 'dart:math';

import 'package:flutter/material.dart';

class Squareandcubescreen extends StatefulWidget {
  const Squareandcubescreen({super.key});

  @override
  State<Squareandcubescreen> createState() => _SquareandcubescreenState();
}

class _SquareandcubescreenState extends State<Squareandcubescreen> {
  TextEditingController textEditingController = TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square and Cube'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Enter a number', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              controller: textEditingController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  calculateMe();
                },
                child: Text('Submit')),
            Container(
              child: Text(result),
            )
          ]),
        ),
      ),
    );
  }

  void calculateMe() {
    double num = double.parse(textEditingController.text);
    double square = num * num;
    double cube = num * num * num;
    double squareroot = sqrt(num);
    var cuberoot = pow(num, 1 / 3);
    result =
        "Square: $square\nCube: $cube\nSquare Root: $squareroot\nCube Root: $cuberoot";
    setState(() {});
  }
}
