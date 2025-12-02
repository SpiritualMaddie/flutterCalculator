import 'dart:math';
import 'package:flutter/material.dart';

Color getRandomNeonColor() {
  const neonColors = [
    Color(0xFFFF00FF), // neon magenta
    Color(0xFF00FFFF), // neon cyan
    Color(0xFF39FF14), // neon green
    Color(0xFFFF5F1F), // neon orange
    Color(0xFF8A2BE2), // electric purple
    Color(0xFFFFFF00), // neon yellow
  ];

  final random = Random();
  return neonColors[random.nextInt(neonColors.length)];
}

