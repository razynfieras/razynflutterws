import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double bmi = 0.0;
  String result = "";
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: heightcontroller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("height(meter)")),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: weightcontroller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), label: Text("weight(kilogram)")),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                calculateBmi();
              },
              child: const Text("Calculate BMI")),
          const SizedBox(
            height: 12,
          ),
          Text('Your BMI is:${bmi.toStringAsFixed(2)} $result')
        ]),
      ),
    );
  }

  void calculateBmi() {
    double height = double.parse(heightcontroller.text);
    double weight = double.parse(weightcontroller.text);
    bmi = weight / (height * height);
    result = '';
    if (bmi < 18.5) {
      result = 'Underweight';
    } else if (bmi < 25) {
      result = 'Normal';
    } else if (bmi < 30) {
      result = 'Overweight';
    } else {
      result = 'Obese';
    }
    // You can display the result in a Text widget or use it as needed
    print('Your BMI is:' + bmi.toStringAsFixed(2) + " $result");
    setState(() {});
  }
}
