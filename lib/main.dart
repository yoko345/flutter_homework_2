import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homework2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'HomeWork2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController firstNumberEditingController = TextEditingController();
  TextEditingController secondNumberEditingController = TextEditingController();
  int firstNumberInt = 0;
  int secondNumberInt = 0;
  int judgeCalculation = 0;
  double calculationResultNumber = 0;

  double decimalCalculator(String firstNumber, String secondNumber, int judgeCalculation) {
      int maxNumber = math.max(
          firstNumber.length - firstNumber.indexOf(".") - 1,
          secondNumber.length - secondNumber.indexOf(".") - 1
      );

      firstNumberInt = int.parse(double.parse(firstNumber).toStringAsFixed(maxNumber).replaceFirst('.', ''));
      secondNumberInt = int.parse(double.parse(secondNumber).toStringAsFixed(maxNumber).replaceFirst('.', ''));

      switch (judgeCalculation) {
        case 0:
          calculationResultNumber = (firstNumberInt + secondNumberInt)/math.pow(10, maxNumber);
          break;
        case 1:
          calculationResultNumber = (firstNumberInt - secondNumberInt)/math.pow(10, maxNumber);
          break;
        case 2:
          calculationResultNumber = (firstNumberInt * secondNumberInt)/math.pow(10, maxNumber * 2);
          break;
        case 3:
          calculationResultNumber = (firstNumberInt / secondNumberInt);
          break;
        default:
          break;
      }

    return calculationResultNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  child: TextField(  // TextFieldは幅などの長さを指定しないとエラーになる
                    controller: firstNumberEditingController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  child: TextField(
                    controller: secondNumberEditingController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Text('結果：$calculationResultNumber',  style: const TextStyle(fontSize: 20),),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    judgeCalculation = 0;
                    setState(() {
                      if(firstNumberEditingController.text.contains('.') || secondNumberEditingController.text.contains('.')) {
                        calculationResultNumber = decimalCalculator(firstNumberEditingController.text, secondNumberEditingController.text, judgeCalculation);
                      } else {
                        calculationResultNumber = double.parse(firstNumberEditingController.text) + double.parse(secondNumberEditingController.text);
                      }
                    });
                  },
                  style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                  child: const Text('+', style: TextStyle(fontSize: 20),),
                ),
                ElevatedButton(
                  onPressed: () {
                    judgeCalculation = 1;
                    setState(() {
                      if(firstNumberEditingController.text.contains('.') || secondNumberEditingController.text.contains('.')) {
                        calculationResultNumber = decimalCalculator(firstNumberEditingController.text, secondNumberEditingController.text, judgeCalculation);
                      } else {
                        calculationResultNumber = double.parse(firstNumberEditingController.text) - double.parse(secondNumberEditingController.text);
                      }
                    });
                  },
                  style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                  child: const Text('−', style: TextStyle(fontSize: 20),),
                ),
                ElevatedButton(
                  onPressed: () {
                    judgeCalculation = 2;
                    setState(() {
                      if(firstNumberEditingController.text.contains('.') || secondNumberEditingController.text.contains('.')) {
                        calculationResultNumber = decimalCalculator(firstNumberEditingController.text, secondNumberEditingController.text, judgeCalculation);
                      } else {
                        calculationResultNumber = double.parse(firstNumberEditingController.text) * double.parse(secondNumberEditingController.text);
                      }
                    });
                  },
                  style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                  child: const Text('×', style: TextStyle(fontSize: 20),),
                ),
                ElevatedButton(
                  onPressed: () {
                    judgeCalculation = 3;
                    setState(() {
                      if(firstNumberEditingController.text.contains('.') || secondNumberEditingController.text.contains('.')) {
                        calculationResultNumber = decimalCalculator(firstNumberEditingController.text, secondNumberEditingController.text, judgeCalculation);
                      } else {
                        calculationResultNumber = double.parse(firstNumberEditingController.text) / double.parse(secondNumberEditingController.text);
                      }
                    });
                  },
                  style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                  child: const Text('÷', style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),

    );
  }
}
