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
  Color accentColor = Colors.white;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      // transformAlignment: AlignmentGeometry.center,
      // constraints: BoxConstraints(
      //   maxWidth: 480,
      //   minWidth: 380,
      //   maxHeight: 900,
      //   minHeight: 800,
      // ),
      color: Theme.of(context).colorScheme.secondary,
      // child: Center(
      //   widthFactor: 0,
      //   heightFactor: 0,
      //     child: AspectRatio(
      //       aspectRatio: 16 / 33.5,
            child: Column(
              children: [
                // Top part of the calculator
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            child: Text(
                              userInput,
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                fontSize: 30,
                              ),
                            ),
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
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom part of the calculator
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(20, 20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(4, 35, 4, 4),
                    //color: Theme.of(context).colorScheme.surface,
                    child: GridView.builder(
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // Clear button (C) and clear all (CE) button
                        if (index == 0 || index == 1) {
                          return Button(
                            buttonTapped: () {
                              setState(() {
                                // If C clear equation else (CE) clear both equation and answer
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
                        // Color button - changes to neon colors on tap and white on long press
                        else if (index == 16) {
                          return Button(
                            buttonTapped: () {
                              setState(() {
                                accentColor = getRandomNeonColor(accentColor);
                              });
                            },
                            buttonLongPressed: () {
                              setState(() {
                                accentColor = Colors.white;
                              });
                            },
                            color: Theme.of(context).colorScheme.secondary,
                            buttonText: buttons[index],
                            textColor: accentColor,
                          );
                        }
                        // Rest of the buttons
                        else {
                          return Button(
                            buttonTapped: () {
                              setState(() {
                                userInput += buttons[index];
                              });
                            },
                            // Colors changing depending on type of button (operators or not)
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
      //     ),
      // ),
    );
  }
}
