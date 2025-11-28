import 'package:flutter/material.dart';
import 'package:flutter_calc/widgets/calculator.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkylator',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 131, 163, 92),
            ).copyWith(
              primary: const Color.fromARGB(255, 98, 122, 68),
              secondary: const Color.fromARGB(255, 203, 233, 168),
              surface: const Color.fromARGB(255, 92, 100, 82),
              onSecondary: const Color.fromARGB(255, 0, 0, 0),
              onPrimary: const Color.fromARGB(255, 255, 255, 255),
            ),
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Kalkylator"),
        //   backgroundColor: Color.fromARGB(255, 131, 163, 92),
        // ),
        body: Calculator(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
