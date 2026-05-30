import 'package:flutter/material.dart';
import '../services/calculator_service.dart';
import '../models/history_item.dart';

class CalculatorProvider with ChangeNotifier {
  String _equation = "0";
  String _result = "0";
  List<HistoryItem> _history = [];
  final CalculatorService _service = CalculatorService();

  String get equation => _equation;
  String get result => _result;
  List<HistoryItem> get history => _history;

  void addToEquation(String sign) {
    if (_equation == "0" && !["+", "-", "×", "÷"].contains(sign)) {
      _equation = sign;
    } else {
      _equation += sign;
    }
    _calculateLive();
    notifyListeners();
  }

  void clearAll() {
    _equation = "0";
    _result = "0";
    notifyListeners();
  }

  void deleteLast() {
    if (_equation.length > 1) {
      _equation = _equation.substring(0, _equation.length - 1);
    } else {
      _equation = "0";
    }
    _calculateLive();
    notifyListeners();
  }

  void calculateResult() {
    _result = _service.evaluate(_equation);
    _history.insert(0, HistoryItem(equation: _equation, result: _result, dateTime: DateTime.now()));
    _equation = _result;
    notifyListeners();
  }

  void _calculateLive() {
    try {
      _result = _service.evaluate(_equation);
    } catch (e) {}
  }

  void setEquationFromExternal(String val) {
    _equation = val;
    _calculateLive();
    notifyListeners();
  }
}
