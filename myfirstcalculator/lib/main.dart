import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyCalcScreen());
  }
}

class MyCalcScreen extends StatefulWidget {
  const MyCalcScreen({super.key});

  @override
  State<MyCalcScreen> createState() => _MyCalcScreenState();
}

class _MyCalcScreenState extends State<MyCalcScreen> {
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calculator"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Welcome to my calculator",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Enter Number 1", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              controller: num1controller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Enter Number 2", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              controller: num2controller,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.yellow),
                    ),
                    onPressed: () {
                      if (num1controller.text.isEmpty ||
                          num2controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter both numbers")));
                        return;
                      }
                      double num1 = double.parse(num1controller.text);
                      double num2 = double.parse(num2controller.text);
                      result = num1 + num2;
                      setState(() {});
                    },
                    child: const Text("+")),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      if (num1controller.text.isEmpty ||
                          num2controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter both numbers")));
                        return;
                      }
                      double num1 = double.parse(num1controller.text);
                      double num2 = double.parse(num2controller.text);
                      result = num1 - num2;
                      setState(() {});
                    },
                    child: const Text("-")),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (num1controller.text.isEmpty ||
                          num2controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter both numbers")));
                        return;
                      }
                      double num1 = double.parse(num1controller.text);
                      double num2 = double.parse(num2controller.text);
                      result = num1 * num2;
                      setState(() {});
                    },
                    child: const Text("x")),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      if (num1controller.text.isEmpty ||
                          num2controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter both numbers")));
                        return;
                      }
                      double num1 = double.parse(num1controller.text);
                      double num2 = double.parse(num2controller.text);
                      result = num1 / num2;
                      setState(() {});
                    },
                    child: const Text("/"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Result " + result.toStringAsFixed(2),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
