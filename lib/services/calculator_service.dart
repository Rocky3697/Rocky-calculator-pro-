import 'package:math_expressions/math_expressions.dart';

class CalculatorService {
  String evaluate(String expression) {
    try {
      String finalExpr = expression.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(finalExpr);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      return eval.toStringAsFixed(eval == eval.toInt() ? 0 : 2);
    } catch (e) {
      return "Error";
    }
  }
}
