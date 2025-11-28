import 'package:math_expressions/math_expressions.dart';

String calculate(String userInput) {
  try {
    String finalInput = userInput;

    // Create the expression via the parser
    ExpressionParser p = GrammarParser();
    Expression exp = p.parse(finalInput);

    // Bind variables
    ContextModel cm = ContextModel();

    // Evaluate expression:
    var evaluator = RealEvaluator(cm);
    num eval = evaluator.evaluate(exp);

    return eval.toString();

  } on Exception {
    String errorMessage = "Error!";
    return errorMessage;
  }
}
