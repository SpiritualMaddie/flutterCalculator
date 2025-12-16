import 'package:flutter/material.dart';
import 'package:flutter_calc/helpers/window_size_helper.dart';
import 'package:flutter_calc/widgets/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// Conditional import - only imports window_manager on non-web platforms
import './helpers/window_size_helper.dart' if (dart.library.html) 'window_size_helper_web.dart';


void main() async {
  // Only set up window manager on desktop (not web or mobile)
  if(!kIsWeb){
    await setupWindow();
  }
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkylator',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 54, 54, 53),
            ).copyWith(
              primary: const Color.fromARGB(255, 102, 142, 67),
              secondary: const Color.fromARGB(235, 222, 164, 46),
              surface: const Color.fromARGB(200, 225, 37, 121),
              onSecondary: const Color.fromARGB(255, 0, 0, 0),
              onPrimary: const Color.fromARGB(220, 203, 245, 53),
            ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight: 2),
        body: Center(
          child: SizedBox(width: 380, height: 800, child: Calculator()),
        ),
      ),
    );
  }
}
