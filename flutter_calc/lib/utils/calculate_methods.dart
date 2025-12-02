import 'package:math_expressions/math_expressions.dart';

String calculate(String userInput) {
  if (!_isInputValid(userInput)) {
    return "Error!";
  }

  if (RegExp(r'/0(?!\d)').hasMatch(userInput)) {
    return "Den gick inte";
  }

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

    // Remove trailing .0 but keep decimals when needed
    if (eval is double && eval == eval.toInt()) {
      return eval.toInt().toString();
    }

    if (eval.isInfinite) {
      return "Du kan inte dela med noll";
    }
    return eval.toString();
  } catch (e) {
    String errorMessage = "Error!";
    return errorMessage;
  }
}

bool _isInputValid(String input) {
  final operators = ["+", "-", "*", "/"];
  if (input.isEmpty) return false;

  // Dont allow any tripple same operators in a row
  if (RegExp(r'[\+\*/%]{2,}').hasMatch(input)) return false;

  // Dont allow "--" unless it's unary minus with a valid prefix
  // Valid: 6*-3  (minus is unary)
  // Valid: 6+-3
  // Invalid: 6--3
  if (RegExp(r'--').hasMatch(input)) return false;

  // Dont allow "+-" or "-+" unless unary
  if (RegExp(r'\+-{2,}|\+{2,}-').hasMatch(input)) return false;

  // Dont allow any operators at the end
  if (operators.contains(input[input.length - 1])) return false;

  // Dont allow any operator at beginning except unary minus
  if (operators.contains(input[0]) && input[0] != "-") return false;

  return true;
}
