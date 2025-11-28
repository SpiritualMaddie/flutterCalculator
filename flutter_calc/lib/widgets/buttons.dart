import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final dynamic color;
  final dynamic textColor;
  final String buttonText;
  final dynamic buttonTapped;

  const Button({
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              boxShadow: kElevationToShadow[2],
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  shadows: kElevationToShadow[1],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
