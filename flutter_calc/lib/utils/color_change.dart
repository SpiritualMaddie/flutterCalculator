import 'dart:math';
import 'package:flutter/material.dart';

// Gives a random color from the list of colors without giving same colors back to back
Color getRandomNeonColor(Color currentColor) {
  const neonColors = [
    Color(0xFFFF00FF), // neon magenta
    Color(0xFF00FFFF), // neon cyan
    Color(0xFF39FF14), // neon green
    Color(0xFFFF5F1F), // neon orange
    Color(0xFF8A2BE2), // electric purple
    Color(0xFFFFFF00), // neon yellow
  ];

  final random = Random();
  Color newColor;

  // Keep rolling until it's not the same color as the current color
  // to always return a new color from the list
  do {
    newColor = neonColors[random.nextInt(neonColors.length)];
  } while (newColor == currentColor);

  currentColor = newColor;
  return newColor;
}

