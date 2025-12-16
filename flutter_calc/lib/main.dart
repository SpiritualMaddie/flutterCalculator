import 'package:flutter/material.dart';
import 'package:flutter_calc/helpers/window_size_helper.dart';
import 'package:flutter_calc/widgets/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import './helpers/window_size_helper.dart';


void main() async {
  // Only set up window manager on desktop (not web or mobile)
  if(!kIsWeb){
    await setupWindow();
  }
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // This widget is the root
  bool _use90sTheme = false;

  void _toggleTheme(){
    setState(() {
      _use90sTheme = !_use90sTheme;
    });
  }

    ColorScheme get _colorScheme {
    if (_use90sTheme) {
      // 90s theme
      return ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 54, 54, 53),
      ).copyWith(
        primary: const Color.fromARGB(255, 102, 142, 67),
        secondary: const Color.fromARGB(235, 222, 164, 46),
        surface: const Color.fromARGB(200, 225, 37, 121),
        onSecondary: const Color.fromARGB(255, 0, 0, 0),
        onPrimary: const Color.fromARGB(220, 203, 245, 53),
      );
    } else {
      // Grey theme
      return ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 54, 54, 53),
      ).copyWith(
        primary: const Color.fromARGB(255, 54, 54, 53),
        secondary: const Color.fromARGB(235, 163, 163, 162),
        surface: const Color.fromARGB(200, 85, 84, 83),
        onSecondary: const Color.fromARGB(255, 0, 0, 0),
        onPrimary: const Color.fromARGB(220, 203, 245, 53),
      );
    }
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkylator',
      theme: ThemeData(
        colorScheme: _colorScheme,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight: 2),
        body: Center(
          child: SizedBox(
            width: 380, 
            height: 800, 
            child: Calculator(onThemeToggle: _toggleTheme,)),
        ),
      ),
    );
  }
}
