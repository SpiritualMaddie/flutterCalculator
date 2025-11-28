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
    "",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userInput,
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(color: Colors.black, fontSize: 60),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(2),
              color: Theme.of(context).colorScheme.surface,
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
                      color: Theme.of(context).colorScheme.primary,
                      buttonText: buttons[index],
                      textColor: Theme.of(context).colorScheme.surfaceBright,
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
                      color: Theme.of(context).colorScheme.primary,
                      buttonText: buttons[index],
                      textColor: Theme.of(context).colorScheme.surfaceBright,
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
                      color: Theme.of(context).colorScheme.primary,
                      buttonText: buttons[index],
                      textColor: Theme.of(context).colorScheme.surfaceBright,
                    );
                  } else {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      textColor: isOperator(buttons[index])
                          ? Theme.of(context).colorScheme.surfaceBright
                          : Theme.of(context).colorScheme.onSecondary,
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
