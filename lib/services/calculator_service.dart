// import 'dart:math';
import 'dart:math' as math;

import 'package:calculus/models/expression_model.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorService {
  final ExpressionModel _expressionModel = ExpressionModel();

  String getExpression() {
    return _expressionModel.expression;
  }

  void appendToExpression(String value) {
    String currentExpression = _expressionModel.expression;
    _expressionModel.setExpression(currentExpression + value);
  }

  void clearExpression() {
    _expressionModel.clearExpression();
  }

  void resetExpression() {
    _expressionModel.resetExpression();
  }

  void evaluate() {
    try {
      String expression = _expressionModel.expression;

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      _expressionModel.setExpression(result.toString());
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void toggleSecondScheme() {
    _expressionModel.toggleSecondScheme();
  }

  void togglePower() {
    _expressionModel.togglePower();
  }

  void toggleCustomRoot() {
    _expressionModel.toggleCustomRoot();
  }

  void toggleMemory() {
    _expressionModel.toggleMemory();
  }

  void toggleAngleMode() {
    _expressionModel.toggleAngleMode();
  }

  bool isMemoryEnabled() {
    return _expressionModel.isMemoryEnabled;
  }

  bool isPowerEnabled() {
    return _expressionModel.isPowerEnabled;
  }

  bool isCustomRootEnabled() {
    return _expressionModel.isCustomRootEnabled;
  }

  bool isSecondScheme() {
    return _expressionModel.isSecondScheme;
  }

  bool isAngleModeEnabled() {
    return _expressionModel.isAngleModeEnabled;
  }

  bool isLogSubscriptYEnabled() {
    return _expressionModel.isLogSubscriptYEnabled;
  }

  void setXValue(double value) {
    _expressionModel.setXValue(value);
  }

  void setYValue(double value) {
    _expressionModel.setYValue(value);
  }

  void backspace() {
    String result = _expressionModel.expression.length > 1
        ? _expressionModel.expression
            .substring(0, _expressionModel.expression.length - 1)
        : '0';

    _expressionModel.setExpression(result);

    _expressionModel.setPower(false);
    _expressionModel.setExponential(false);
    _expressionModel.setTenToPowerX(false);
    _expressionModel.setTwoToPowerX(false);
    _expressionModel.setCustomRoot(false);
    _expressionModel.setLogSubscriptY(false);

    _expressionModel.setXValue(0.0);
    _expressionModel.setYValue(0.0);
  }

  void changeSign() {
    if (_expressionModel.expression != '0') {
      String result = _expressionModel.expression.startsWith('-')
          ? _expressionModel.expression.substring(1)
          : '-$_expressionModel.expression';

      _expressionModel.setExpression(result);
    }
  }

  void evaluateExpression() {
    if (_expressionModel.isPowerEnabled) {
      calculatePower();
      return;
    }

    if (_expressionModel.isExponentialEnabled) {
      calculateExponential();
      return;
    }

    if (_expressionModel.isTenToPowerXEnabled) {
      calculateTenToPowerX();
      return;
    }

    if (_expressionModel.isTwoToPowerXEnabled) {
      calculateTwoToPowerX();
      return;
    }

    if (_expressionModel.isCustomRootEnabled) {
      calculateCustomRoot();
      return;
    }

    if (_expressionModel.isLogSubscriptYEnabled) {
      calculateLogSubscriptY();
      return;
    }

    evaluate();
  }

  void applyPercentage() {
    try {
      String expression = _expressionModel.expression;
      String result = expression += '/100';

      _expressionModel.setExpression(result);
      evaluateExpression();
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void appendOperator(String operator) {
    String expression = _expressionModel.expression;
    String result = expression += operator;

    _expressionModel.setExpression(result);
  }

  void addDecimalPoint() {
    if (!_expressionModel.expression.contains('.')) {
      String expression = _expressionModel.expression;
      String result = expression += '.';

      _expressionModel.setExpression(result);
    }
  }

  void clearMemory() {
    _expressionModel.setMemory(false);
    _expressionModel.resetMemoryValue();
  }

  void addToMemory() {
    double memoryValue = _expressionModel.memoryValue;

    memoryValue += double.parse(_expressionModel.expression);

    _expressionModel.setMemory(true);
    _expressionModel.setMemoryValue(memoryValue);
  }

  void subtractFromMemory() {
    double memoryValue = _expressionModel.memoryValue;

    memoryValue -= double.parse(_expressionModel.expression);

    _expressionModel.setMemory(true);
    _expressionModel.setMemoryValue(memoryValue);
  }

  void recallMemory() {
    double memoryValue = _expressionModel.memoryValue;
    String result = _isInt(_expressionModel.memoryValue)
        ? '$memoryValue'.split('.')[0]
        : '$memoryValue';

    _expressionModel.setMemory(true);
    _expressionModel.setExpression(result);
  }

  void changeScheme() {
    _expressionModel.toggleSecondScheme();
  }

  void square() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _expressionModel.setExpression('($exp)^2');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void cube() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _expressionModel.setExpression('($exp)^3');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void power() {
    double xValue = double.parse(_expressionModel.expression);

    _expressionModel.setXValue(xValue);
    _expressionModel.togglePower();
    _expressionModel.resetExpression();
  }

  void exponentialPower() {
    try {
      double xValue = double.parse(_expressionModel.expression);

      _expressionModel.setXValue(xValue);
      _expressionModel.toggleExponential();
      evaluateExpression();
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void tenToPowerX() {
    try {
      double xValue = double.parse(_expressionModel.expression);

      _expressionModel.setXValue(xValue);
      _expressionModel.setTenToPowerX(true);

      evaluateExpression();
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void twoToPowerX() {
    try {
      double xValue = double.parse(_expressionModel.expression);

      _expressionModel.setXValue(xValue);
      _expressionModel.setTwoToPowerX(true);

      evaluateExpression();
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void reciprocal() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      _expressionModel.setExpression('1/($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void squareRootSquare() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      _expressionModel.setExpression('($exp)^(1/2)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void cubeRootSquare() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      _expressionModel.setExpression('($exp)^(1/3)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void customRoot() {
    double yValue = double.parse(_expressionModel.expression);

    _expressionModel.setYValue(yValue);
    _expressionModel.toggleCustomRoot();
  }

  void ln() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      _expressionModel.setExpression('ln($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void logSubscript2() {
    try {
      double value = double.parse(_expressionModel.expression);
      double result = math.log(value) / math.log(2);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void logSubscript10() {
    try {
      double value = double.parse(_expressionModel.expression);
      double result = math.log(value) / math.ln10;
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void logSubscriptY() {
    double yValue = double.parse(_expressionModel.expression);

    _expressionModel.setYValue(yValue);
    _expressionModel.toggleLogSubscriptY();
    _expressionModel.resetExpression();
  }

  void factorial() {
    try {
      int value = int.parse(_expressionModel.expression);

      if (value < 0) {
        _expressionModel.setExpressionError();
        return;
      }

      int result = 1;
      for (int i = 2; i <= value; i++) {
        result *= i;
      }

      _expressionModel.setExpression('$result');
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void sine() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _expressionModel.setExpression('sin($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);

      _expressionModel.setExpression('$result');
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void cosine() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _expressionModel.setExpression('cos($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      _expressionModel.setExpression('$result');
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void tangent() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));
      _expressionModel.setExpression('tan($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);

      _expressionModel.setExpression('$result');
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void exponential() {
    try {
      double eValue = math.exp(1);

      _expressionModel.setExpression('$eValue');
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.resetExpression();
  }

  void ee() {
    try {
      String powerExpression = _expressionModel.expression
          .substring(_expressionModel.expression.lastIndexOf('^') + 1);
      double power = double.parse(powerExpression);
      double result =
          double.parse(_expressionModel.expression) * math.pow(10, power);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void setAngleMode() {
    _expressionModel.toggleAngleMode();
  }

  void sineh() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);

      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _sinh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void cosineh() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _cosh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void tangenth() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _tanh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }
  }

  void pi() {
    double piValue = math.pi;
    _expressionModel.setExpression('$piValue');
  }

  void rand() {
    String expression = math.Random().nextDouble().toString();
    _expressionModel.setExpression(expression);
  }

  void appendText(String newText) {
    if (_expressionModel.isResetExpression) {
      _expressionModel.setExpression('');
      _expressionModel.setResetExpression(false);
    }

    String expression = _expressionModel.expression;

    if (_expressionModel.isPowerEnabled ||
        _expressionModel.isCustomRootEnabled ||
        _expressionModel.isLogSubscriptYEnabled) {
      expression += newText;
    } else {
      expression = (expression == '0') ? newText : expression + newText;
    }

    _expressionModel.setExpression(expression);
  }

  void calculatePower() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);
      String originalExpression = _expressionModel.expression;

      _expressionModel.resetExpression();
      double yValue = double.parse(originalExpression);

      _expressionModel.setYValue(yValue);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_expressionModel.xValue));
      cm.bindVariable(Variable('y'), Number(_expressionModel.yValue));

      _expressionModel.setExpression('x^y');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.setXValue(0.0);
    _expressionModel.setYValue(0.0);

    _expressionModel.setPower(false);
    _expressionModel.resetExpression();
  }

  void calculateExponential() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_expressionModel.xValue));

      _expressionModel.setExpression('e^($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.setXValue(0.0);
    _expressionModel.setYValue(0.0);
    _expressionModel.setExponential(false);
  }

  void calculateTenToPowerX() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_expressionModel.xValue));

      _expressionModel.setExpression('10^($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.setXValue(0.0);
    _expressionModel.setYValue(0.0);
    _expressionModel.setTenToPowerX(false);
  }

  void calculateTwoToPowerX() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_expressionModel.xValue));

      _expressionModel.setExpression('2^($exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.setXValue(0.0);
    _expressionModel.setYValue(0.0);
    _expressionModel.setTwoToPowerX(false);
  }

  void calculateCustomRoot() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expressionModel.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('y'), Number(_expressionModel.yValue));

      _expressionModel.setExpression('(y)^(1/$exp)');

      exp = p.parse(_expressionModel.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.resetExpression();
    }

    _expressionModel.setXValue(0.0);
    _expressionModel.setCustomRoot(false);
    _expressionModel.resetExpression();
  }

  void calculateLogSubscriptY() {
    try {
      double value = double.parse(_expressionModel.expression);
      double result = math.log(_expressionModel.yValue) / math.log(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _expressionModel.setExpression(expression);
    } catch (e) {
      _expressionModel.setExpressionError();
    }

    _expressionModel.setXValue(0.0);
    _expressionModel.setLogSubscriptY(false);
    _expressionModel.resetExpression();
  }

  double _sinh(double x) {
    return (math.exp(x) - math.exp(-x)) / 2;
  }

  double _cosh(double x) {
    return (math.exp(x) + math.exp(-x)) / 2;
  }

  double _tanh(double x) {
    double ex = math.exp(x);
    double eMinusX = math.exp(-x);
    return (ex - eMinusX) / (ex + eMinusX);
  }

  bool _isInt(num value, {double epsilon = 1e-10}) {
    return value is int || (value - value.roundToDouble()).abs() < epsilon;
  }
}
