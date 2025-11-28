import 'package:flutter/material.dart';
import 'package:flutter_calc/utils/booleans.dart';
import 'package:flutter_calc/utils/calculate_methods.dart';
import 'package:flutter_calc/widgets/buttons.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = "";
  var userAnswer = "";

  final List<String> buttons = [
    "C",
    "CE",
    "DEL",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "-",
    " ",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.amberAccent[50],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(92, 121, 85, 72),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.elliptical(12, 12),
                        right: Radius.elliptical(12, 12),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userInput,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(92, 121, 85, 72),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.elliptical(12, 12),
                        right: Radius.elliptical(12, 12),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.amberAccent,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // Clear button
                  if (index == 0 || index == 1) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          if (index == 0) {
                            userInput = "";
                          } else {
                            userInput = "";
                            userAnswer = "";
                          }
                        });
                      },
                      color: Colors.green,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  }
                  // Delete button
                  else if (index == 2) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          if (userInput.isNotEmpty) {
                            userInput = userInput.substring(
                              0,
                              userInput.length - 1,
                            );
                          } else {
                            userInput = "";
                          }
                        });
                      },
                      color: Colors.green,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  }
                  // Equal button
                  else if (index == buttons.length - 1) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userAnswer = calculate(userInput);
                        });
                      },
                      color: Colors.green,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  } else {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Colors.green
                          : Colors.lime,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.green[900],
                      buttonText: buttons[index],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
