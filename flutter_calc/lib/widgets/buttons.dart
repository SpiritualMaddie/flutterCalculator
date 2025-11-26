import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;

  const Button({super.key, 
    required this.color,
    required this.textColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          decoration: BoxDecoration(
            color: color, 
            boxShadow: kElevationToShadow[2]),
          child: Center(
            child: Text(
              buttonText, 
              style: TextStyle(
                color: textColor,
                fontSize: 25,
                shadows: kElevationToShadow[1]
              )
            ),
          ),
        ),
      ),
    );
  }
}
