import 'package:flutter/material.dart';
import 'package:flutter_calc/utils/utils.dart';
import 'package:flutter_calc/widgets/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = "";
  var userAnswer = "";
  Color accentColor = getRandomNeonColor();

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
    "🎨",
    "0",
    ".",
    "=",
  ];

  void changeAccentColor(){
    setState(() {
      accentColor = getRandomNeonColor();
    });
  }

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
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary, 
                        fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary, 
                          fontSize: 60
                          ),
                      ),
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
                      textColor: accentColor,
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
                      textColor: accentColor,
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
                      textColor: accentColor,
                    );
                  }
                  // Color button
                  else if (index == 16) {
                    return Button(
                      buttonTapped: () {
                        changeAccentColor();
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      buttonText: buttons[index],
                      textColor: accentColor,
                    );
                  }
                  else {
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
                          ? accentColor
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
