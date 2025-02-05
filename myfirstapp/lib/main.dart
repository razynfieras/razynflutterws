import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String myText = "";
  TextEditingController myTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("My name is Razyn"),
              const Text("I am learning flutter"),
              const Text("Flutter is great!"),
              const Text("I am learning programming"),
              TextField(
                controller: myTextController,
              ),
              ElevatedButton(
                  onPressed: () {
                    myText = myTextController.text;
                    setState(() {});
                    print(myText);
                  },
                  child: const Text("Press me!")),
              Text(myText),
              ElevatedButton(
                  onPressed: () {
                    myTextController.text = "";
                    myText = "";
                    setState(() {});
                  },
                  child: Text("clear"))
            ],
          ),
        ),
      ),
    );
  }
}
