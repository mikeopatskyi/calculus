import 'package:math_expressions/math_expressions.dart';
import 'package:mobx/mobx.dart';

part 'calculator_store.g.dart';

class CalculatorStore extends _CalculatorStore with _$CalculatorStore {
  CalculatorStore._();
  factory CalculatorStore.getInstance() => _instance;
  static final CalculatorStore _instance = CalculatorStore._();
}

abstract class _CalculatorStore with Store {
  @observable
  String _expression = '0';

  @computed
  String get expression => _expression;

  @action
  void setExpression(String expression) {
    expression = replaceOnVirtualOperators(expression);
    _expression = expression;
  }

  @action
  void removeFirstCharacter() {
    String result = _expression.length > 1 ? _expression.substring(1) : '0';

    setExpression(result);
  }

  @action
  void removeLastCharacter() {
    String result = _expression.length > 1
        ? _expression.substring(0, _expression.length - 1)
        : '0';

    setExpression(result);
  }

  @action
  void setExpressionError() {
    _expression = 'Error';
  }

  @action
  void clearExpression() {
    _expression = '';
  }

  @action
  void resetExpression() {
    _expression = '0';
  }

  @action
  void backspace() {
    String result = expression.length > 1
        ? expression.substring(0, expression.length - 1)
        : '0';

    setExpression(result);
  }

  @action
  void changeSign() {
    if (expression != '0') {
      String result =
          expression.startsWith('-') ? expression.substring(1) : '-$expression';

      setExpression(result);
    }
  }

  @action
  void evaluate() {
    try {
      Parser p = Parser();
      String originalExpression = replaceOnRealOperators(expression);
      Expression exp = p.parse(originalExpression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      String resultString =
          _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(resultString);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void applyPercentage() {
    try {
      String temporaryExpression = expression;
      String result = temporaryExpression += '/100';

      setExpression(result);
      evaluate();
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void appendOperator(String operator) {
    try {
      String temporaryExpression = expression;
      String result = temporaryExpression += operator;
      bool isMathOperation = _isMathOperation(operator);
      bool endsWithMathOperation = _endsWithMathOperation(_expression);

      if (_expression == '0' || _expression.isEmpty) {
        return;
      }

      if (isMathOperation && endsWithMathOperation) {
        return;
      }

      setExpression(result);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void addDecimalPoint() {
    if (!expression.contains('.')) {
      String temporaryExpression = expression;
      String result = temporaryExpression += '.';

      setExpression(result);
    }
  }

  @action
  void appendText(String newText) {
    String originalExpression = _expression;

    String result =
        (originalExpression == '0') ? newText : originalExpression + newText;

    setExpression(result);
  }

  bool _isInt(num value, {double epsilon = 1e-10}) {
    return value is int || (value - value.roundToDouble()).abs() < epsilon;
  }

  bool _endsWithMathOperation(String input) {
    if (input.isEmpty) {
      return false;
    }

    final lastChar = input.substring(input.length - 1);
    return _isMathOperation(lastChar);
  }

  bool _isMathOperation(String value) {
    return value == '+' ||
        value == '-' ||
        value == '*' ||
        value == '/' ||
        value == '×' ||
        value == '÷';
  }

  String replaceOnVirtualOperators(String input) {
    return input.replaceAll('*', '×').replaceAll('/', '÷');
  }

  String replaceOnRealOperators(String input) {
    return input.replaceAll('×', '*').replaceAll('÷', '/');
  }
}
