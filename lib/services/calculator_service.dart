// import 'dart:math';
import 'dart:math' as math;

import 'package:math_expressions/math_expressions.dart';
import 'package:calculus/store/calculator_store.dart';

class CalculatorService {
  final CalculatorStore _calculatorStore;

  CalculatorService(this._calculatorStore);

  String getExpression() {
    return _calculatorStore.expression;
  }

  void appendToExpression(String value) {
    String currentExpression = _calculatorStore.expression;
    _calculatorStore.setExpression(currentExpression + value);
  }

  void clearExpression() {
    _calculatorStore.clearExpression();
  }

  void resetExpression() {
    _calculatorStore.resetExpression();
  }

  void evaluate() {
    try {
      String expression = _calculatorStore.expression;

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      _calculatorStore.setExpression(result.toString());
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void toggleSecondScheme() {
    _calculatorStore.toggleSecondScheme();
  }

  void togglePower() {
    _calculatorStore.togglePower();
  }

  void toggleCustomRoot() {
    _calculatorStore.toggleCustomRoot();
  }

  void toggleMemory() {
    _calculatorStore.toggleMemory();
  }

  void toggleAngleMode() {
    _calculatorStore.toggleAngleMode();
  }

  bool isMemoryEnabled() {
    return _calculatorStore.isMemoryEnabled;
  }

  bool isPowerEnabled() {
    return _calculatorStore.isPowerEnabled;
  }

  bool isCustomRootEnabled() {
    return _calculatorStore.isCustomRootEnabled;
  }

  bool isSecondScheme() {
    return _calculatorStore.isSecondScheme;
  }

  bool isAngleModeEnabled() {
    return _calculatorStore.isAngleModeEnabled;
  }

  bool isLogSubscriptYEnabled() {
    return _calculatorStore.isLogSubscriptYEnabled;
  }

  void setXValue(double value) {
    _calculatorStore.setXValue(value);
  }

  void setYValue(double value) {
    _calculatorStore.setYValue(value);
  }

  void backspace() {
    String result = _calculatorStore.expression.length > 1
        ? _calculatorStore.expression
            .substring(0, _calculatorStore.expression.length - 1)
        : '0';

    _calculatorStore.setExpression(result);

    _calculatorStore.setPower(false);
    _calculatorStore.setExponential(false);
    _calculatorStore.setTenToPowerX(false);
    _calculatorStore.setTwoToPowerX(false);
    _calculatorStore.setCustomRoot(false);
    _calculatorStore.setLogSubscriptY(false);

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setYValue(0.0);
  }

  void changeSign() {
    if (_calculatorStore.expression != '0') {
      String result = _calculatorStore.expression.startsWith('-')
          ? _calculatorStore.expression.substring(1)
          : '-$_calculatorStore.expression';

      _calculatorStore.setExpression(result);
    }
  }

  void evaluateExpression() {
    if (_calculatorStore.isPowerEnabled) {
      calculatePower();
      return;
    }

    if (_calculatorStore.isExponentialEnabled) {
      calculateExponential();
      return;
    }

    if (_calculatorStore.isTenToPowerXEnabled) {
      calculateTenToPowerX();
      return;
    }

    if (_calculatorStore.isTwoToPowerXEnabled) {
      calculateTwoToPowerX();
      return;
    }

    if (_calculatorStore.isCustomRootEnabled) {
      calculateCustomRoot();
      return;
    }

    if (_calculatorStore.isLogSubscriptYEnabled) {
      calculateLogSubscriptY();
      return;
    }

    evaluate();
  }

  void applyPercentage() {
    try {
      String expression = _calculatorStore.expression;
      String result = expression += '/100';

      _calculatorStore.setExpression(result);
      evaluateExpression();
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void appendOperator(String operator) {
    String expression = _calculatorStore.expression;
    String result = expression += operator;

    _calculatorStore.setExpression(result);
  }

  void addDecimalPoint() {
    if (!_calculatorStore.expression.contains('.')) {
      String expression = _calculatorStore.expression;
      String result = expression += '.';

      _calculatorStore.setExpression(result);
    }
  }

  void clearMemory() {
    _calculatorStore.setMemory(false);
    _calculatorStore.resetMemoryValue();
  }

  void addToMemory() {
    double memoryValue = _calculatorStore.memoryValue;

    memoryValue += double.parse(_calculatorStore.expression);

    _calculatorStore.setMemory(true);
    _calculatorStore.setMemoryValue(memoryValue);
  }

  void subtractFromMemory() {
    double memoryValue = _calculatorStore.memoryValue;

    memoryValue -= double.parse(_calculatorStore.expression);

    _calculatorStore.setMemory(true);
    _calculatorStore.setMemoryValue(memoryValue);
  }

  void recallMemory() {
    double memoryValue = _calculatorStore.memoryValue;
    String result = _isInt(_calculatorStore.memoryValue)
        ? '$memoryValue'.split('.')[0]
        : '$memoryValue';

    _calculatorStore.setMemory(true);
    _calculatorStore.setExpression(result);
  }

  void changeScheme() {
    _calculatorStore.toggleSecondScheme();
  }

  void square() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _calculatorStore.setExpression('($exp)^2');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void cube() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _calculatorStore.setExpression('($exp)^3');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void power() {
    double xValue = double.parse(_calculatorStore.expression);

    _calculatorStore.setXValue(xValue);
    _calculatorStore.togglePower();
    _calculatorStore.resetExpression();
  }

  void exponentialPower() {
    try {
      double xValue = double.parse(_calculatorStore.expression);

      _calculatorStore.setXValue(xValue);
      _calculatorStore.toggleExponential();
      evaluateExpression();
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void tenToPowerX() {
    try {
      double xValue = double.parse(_calculatorStore.expression);

      _calculatorStore.setXValue(xValue);
      _calculatorStore.setTenToPowerX(true);

      evaluateExpression();
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void twoToPowerX() {
    try {
      double xValue = double.parse(_calculatorStore.expression);

      _calculatorStore.setXValue(xValue);
      _calculatorStore.setTwoToPowerX(true);

      evaluateExpression();
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void reciprocal() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      _calculatorStore.setExpression('1/($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void squareRootSquare() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      _calculatorStore.setExpression('($exp)^(1/2)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void cubeRootSquare() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      _calculatorStore.setExpression('($exp)^(1/3)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void customRoot() {
    double yValue = double.parse(_calculatorStore.expression);

    _calculatorStore.setYValue(yValue);
    _calculatorStore.toggleCustomRoot();
  }

  void ln() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      _calculatorStore.setExpression('ln($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void logSubscript2() {
    try {
      double value = double.parse(_calculatorStore.expression);
      double result = math.log(value) / math.log(2);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void logSubscript10() {
    try {
      double value = double.parse(_calculatorStore.expression);
      double result = math.log(value) / math.ln10;
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void logSubscriptY() {
    double yValue = double.parse(_calculatorStore.expression);

    _calculatorStore.setYValue(yValue);
    _calculatorStore.toggleLogSubscriptY();
    _calculatorStore.resetExpression();
  }

  void factorial() {
    try {
      int value = int.parse(_calculatorStore.expression);

      if (value < 0) {
        _calculatorStore.setExpressionError();
        return;
      }

      int result = 1;
      for (int i = 2; i <= value; i++) {
        result *= i;
      }

      _calculatorStore.setExpression('$result');
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void sine() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _calculatorStore.setExpression('sin($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);

      _calculatorStore.setExpression('$result');
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void cosine() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));

      _calculatorStore.setExpression('cos($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      _calculatorStore.setExpression('$result');
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void tangent() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(0));
      _calculatorStore.setExpression('tan($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);

      _calculatorStore.setExpression('$result');
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void exponential() {
    try {
      double eValue = math.exp(1);

      _calculatorStore.setExpression('$eValue');
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.resetExpression();
  }

  void ee() {
    try {
      String powerExpression = _calculatorStore.expression
          .substring(_calculatorStore.expression.lastIndexOf('^') + 1);
      double power = double.parse(powerExpression);
      double result =
          double.parse(_calculatorStore.expression) * math.pow(10, power);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void setAngleMode() {
    _calculatorStore.toggleAngleMode();
  }

  void sineh() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);

      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _sinh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void cosineh() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _cosh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void tangenth() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _tanh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }
  }

  void pi() {
    double piValue = math.pi;
    _calculatorStore.setExpression('$piValue');
  }

  void rand() {
    String expression = math.Random().nextDouble().toString();
    _calculatorStore.setExpression(expression);
  }

  void appendText(String newText) {
    // if (_calculatorStore.isResetExpression) {
    //   _calculatorStore.setExpression('');
    //   _calculatorStore.setResetExpression(false);
    // }

    // String expression = _calculatorStore.expression;

    // if (_calculatorStore.isPowerEnabled ||
    //     _calculatorStore.isCustomRootEnabled ||
    //     _calculatorStore.isLogSubscriptYEnabled) {
    //   expression += newText;
    // } else {
    //   expression = (expression == '0') ? newText : expression + newText;
    // }

    // _calculatorStore.setExpression(expression);
    _calculatorStore.appendText(newText);
  }

  void calculatePower() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);
      String originalExpression = _calculatorStore.expression;

      _calculatorStore.resetExpression();
      double yValue = double.parse(originalExpression);

      _calculatorStore.setYValue(yValue);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_calculatorStore.xValue));
      cm.bindVariable(Variable('y'), Number(_calculatorStore.yValue));

      _calculatorStore.setExpression('x^y');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setYValue(0.0);

    _calculatorStore.setPower(false);
    _calculatorStore.resetExpression();
  }

  void calculateExponential() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_calculatorStore.xValue));

      _calculatorStore.setExpression('e^($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setYValue(0.0);
    _calculatorStore.setExponential(false);
  }

  void calculateTenToPowerX() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_calculatorStore.xValue));

      _calculatorStore.setExpression('10^($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setYValue(0.0);
    _calculatorStore.setTenToPowerX(false);
  }

  void calculateTwoToPowerX() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_calculatorStore.xValue));

      _calculatorStore.setExpression('2^($exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setYValue(0.0);
    _calculatorStore.setTwoToPowerX(false);
  }

  void calculateCustomRoot() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_calculatorStore.expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('y'), Number(_calculatorStore.yValue));

      _calculatorStore.setExpression('(y)^(1/$exp)');

      exp = p.parse(_calculatorStore.expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.resetExpression();
    }

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setCustomRoot(false);
    _calculatorStore.resetExpression();
  }

  void calculateLogSubscriptY() {
    try {
      double value = double.parse(_calculatorStore.expression);
      double result = math.log(_calculatorStore.yValue) / math.log(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      _calculatorStore.setExpression(expression);
    } catch (e) {
      _calculatorStore.setExpressionError();
    }

    _calculatorStore.setXValue(0.0);
    _calculatorStore.setLogSubscriptY(false);
    _calculatorStore.resetExpression();
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

  bool isInt(num value, {double epsilon = 1e-10}) {
    return value is int || (value - value.roundToDouble()).abs() < epsilon;
  }
}
