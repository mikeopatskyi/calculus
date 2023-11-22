import 'package:math_expressions/math_expressions.dart';
import 'package:mobx/mobx.dart';
import 'dart:math' as math;

part 'calculator_store.g.dart';

class CalculatorStore extends _CalculatorStore with _$CalculatorStore {
  CalculatorStore._();
  factory CalculatorStore.getInstance() => _instance;
  static final CalculatorStore _instance = CalculatorStore._();
}

abstract class _CalculatorStore with Store {
  @observable
  String _expression = '0';

  @observable
  double _xValue = 0.0;

  @observable
  double _yValue = 0.0;

  @observable
  double _memoryValue = 0.0;

  @observable
  bool _isSecondScheme = false;

  @observable
  bool _isResetExpression = false;

  @observable
  bool _isMemoryEnabled = false;

  @observable
  bool _isPowerEnabled = false;

  @observable
  bool _isExponentialEnabled = false;

  @observable
  bool _isTenToPowerXEnabled = false;

  @observable
  bool _isTwoToPowerXEnabled = false;

  @observable
  bool _isCustomRootEnabled = false;

  @observable
  bool _isAngleModeEnabled = false;

  @observable
  bool _isLogSubscriptYEnabled = false;

  @computed
  String get expression => _expression;

  @computed
  double get xValue => _xValue;

  @computed
  double get yValue => _yValue;

  @computed
  double get memoryValue => _memoryValue;

  @computed
  bool get isMemoryEnabled => _isMemoryEnabled;

  @computed
  bool get isResetExpression => _isResetExpression;

  @computed
  bool get isPowerEnabled => _isPowerEnabled;

  @computed
  bool get isExponentialEnabled => _isExponentialEnabled;

  @computed
  bool get isTenToPowerXEnabled => _isTenToPowerXEnabled;

  @computed
  bool get isTwoToPowerXEnabled => _isTwoToPowerXEnabled;

  @computed
  bool get isCustomRootEnabled => _isCustomRootEnabled;

  @computed
  bool get isSecondScheme => _isSecondScheme;

  @computed
  bool get isAngleModeEnabled => _isAngleModeEnabled;

  @computed
  bool get isLogSubscriptYEnabled => _isLogSubscriptYEnabled;

  @action
  void setExpression(String expression) {
    _expression = expression;
  }

  @action
  void removeFirstCharacter() {
    _expression = _expression.length > 1 ? _expression.substring(1) : '0';
  }

  @action
  void removeLastCharacter() {
    _expression = _expression.length > 1
        ? _expression.substring(0, _expression.length - 1)
        : '0';
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
  void setXValue(double value) {
    _xValue = value;
  }

  @action
  void setYValue(double value) {
    _yValue = value;
  }

  @action
  void setMemoryValue(double value) {
    _memoryValue = value;
  }

  @action
  void resetMemoryValue() {
    _memoryValue = 0.0;
  }

  @action
  void setSecondScheme(bool value) {
    _isSecondScheme = value;
  }

  @action
  void setResetExpression(bool value) {
    _isResetExpression = value;
  }

  @action
  void setPower(bool value) {
    _isPowerEnabled = value;
  }

  @action
  void setExponential(bool value) {
    _isExponentialEnabled = value;
  }

  @action
  void setTenToPowerX(bool value) {
    _isTenToPowerXEnabled = value;
  }

  @action
  void setTwoToPowerX(bool value) {
    _isTwoToPowerXEnabled = value;
  }

  @action
  void setCustomRoot(bool value) {
    _isCustomRootEnabled = value;
  }

  @action
  void setMemory(bool value) {
    _isMemoryEnabled = value;
  }

  @action
  void setAngleMode(bool value) {
    _isAngleModeEnabled = value;
  }

  @action
  void setLogSubscriptY(bool value) {
    _isLogSubscriptYEnabled = value;
  }

  @action
  void toggleSecondScheme() {
    _isSecondScheme = !_isSecondScheme;
  }

  @action
  void toggleResetExpression() {
    _isResetExpression = !_isResetExpression;
  }

  @action
  void togglePower() {
    _isPowerEnabled = !_isPowerEnabled;
  }

  @action
  void toggleExponential() {
    _isExponentialEnabled = !_isExponentialEnabled;
  }

  @action
  void toggleTenToPowerX() {
    _isTenToPowerXEnabled = !_isTenToPowerXEnabled;
  }

  @action
  void toggleTwoToPowerX() {
    _isTwoToPowerXEnabled = !_isTwoToPowerXEnabled;
  }

  @action
  void toggleCustomRoot() {
    _isCustomRootEnabled = !_isCustomRootEnabled;
  }

  @action
  void toggleMemory() {
    _isMemoryEnabled = !_isMemoryEnabled;
  }

  @action
  void toggleAngleMode() {
    _isAngleModeEnabled = !_isAngleModeEnabled;
  }

  @action
  void toggleLogSubscriptY() {
    _isLogSubscriptYEnabled = !_isLogSubscriptYEnabled;
  }

  /////////////////////////////////////////////////////////////////////////////
  /// Methods
  /////////////////////////////////////////////////////////////////////////////

  @action
  void backspace() {
    String result = expression.length > 1
        ? expression.substring(0, expression.length - 1)
        : '0';

    setExpression(result);

    setPower(false);
    setExponential(false);
    setTenToPowerX(false);
    setTwoToPowerX(false);
    setCustomRoot(false);
    setLogSubscriptY(false);

    setXValue(0.0);
    setYValue(0.0);
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
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      String resultString =
          _isInt(result) ? '$result'.split('.')[0] : '$result';
      print('---------------$resultString-----------------');
      setExpression(resultString);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void evaluateExpression() {
    final conditions = [
      _isPowerEnabled,
      _isExponentialEnabled,
      _isTenToPowerXEnabled,
      _isTwoToPowerXEnabled,
      _isCustomRootEnabled,
      _isLogSubscriptYEnabled,
    ];

    final functions = [
      () {
        print('power');
        calculatePower();
      },
      () {
        print('exponential');
        calculateExponential();
      },
      () {
        print('tenToPowerX');
        calculateTenToPowerX();
      },
      () {
        print('twoToPowerX');
        calculateTwoToPowerX();
      },
      () {
        print('customRoot');
        calculateCustomRoot();
      },
      () {
        print('logSubscriptY');
        calculateLogSubscriptY();
      },
    ];

    for (int i = 0; i < conditions.length; i++) {
      if (conditions[i]) {
        functions[i]();
        return;
      }
    }

    print('evaluate');
    evaluate();
  }

  @action
  void applyPercentage() {
    try {
      String temporaryExpression = expression;
      String result = temporaryExpression += '/100';

      setExpression(result);
      evaluateExpression();
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void appendOperator(String operator) {
    String temporaryExpression = expression;
    String result = temporaryExpression += operator;

    setExpression(result);
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
  void clearMemory() {
    setMemory(false);
    resetMemoryValue();
  }

  @action
  void addToMemory() {
    double memoryValue = _memoryValue;

    memoryValue += double.parse(expression);

    setMemory(true);
    setMemoryValue(memoryValue);
  }

  @action
  void subtractFromMemory() {
    double memoryValue = _memoryValue;

    memoryValue -= double.parse(expression);

    setMemory(true);
    setMemoryValue(memoryValue);
  }

  @action
  void recallMemory() {
    double memoryValue = _memoryValue;
    String result =
        _isInt(memoryValue) ? '$memoryValue'.split('.')[0] : '$memoryValue';

    setMemory(true);
    setExpression(result);
  }

  @action
  void changeScheme() {
    toggleSecondScheme();
  }

  @action
  void square() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(_xValue));

      setExpression('($exp)^2');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void cube() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(_xValue));

      setExpression('($exp)^3');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void power() {
    try {
      double xValue = double.parse(expression);

      setXValue(xValue);
      togglePower();
      clearExpression();
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void exponentialPower() {
    try {
      double xValue = double.parse(expression);

      setXValue(xValue);
      toggleExponential();
      evaluateExpression();
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void tenToPowerX() {
    try {
      double xValue = double.parse(expression);

      setXValue(xValue);
      setTenToPowerX(true);

      evaluateExpression();
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void twoToPowerX() {
    try {
      double xValue = double.parse(expression);

      setXValue(xValue);
      setTwoToPowerX(true);

      evaluateExpression();
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void reciprocal() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setExpression('1/($exp)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void squareRootSquare() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setExpression('($exp)^(1/2)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void cubeRootSquare() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setExpression('($exp)^(1/3)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void customRoot() {
    double yValue = double.parse(expression);

    setYValue(yValue);
    toggleCustomRoot();
  }

  @action
  void ln() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      setExpression('ln($exp)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void logSubscript2() {
    try {
      double value = double.parse(_expression);
      double result = math.log(value) / math.log(2);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void logSubscript10() {
    try {
      double value = double.parse(_expression);
      double result = math.log(value) / math.ln10;
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void logSubscriptY() {
    double yValue = double.parse(expression);

    setYValue(yValue);
    toggleLogSubscriptY();
    resetExpression();
  }

  @action
  void factorial() {
    try {
      int value = int.parse(expression);

      if (value < 0) {
        setExpressionError();
        return;
      }

      int result = 1;
      for (int i = 2; i <= value; i++) {
        result *= i;
      }

      setExpression('$result');
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void sine() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(_xValue));

      setExpression('sin($exp)');

      exp = p.parse(expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);

      setExpression('$result');
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void cosine() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(_xValue));

      setExpression('cos($exp)');

      exp = p.parse(expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      setExpression('$result');
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void tangent() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      cm.bindVariable(Variable('x'), Number(_xValue));
      setExpression('tan($exp)');

      exp = p.parse(expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);

      setExpression('$result');
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void exponential() {
    try {
      double eValue = math.exp(1);

      setExpression('$eValue');
    } catch (e) {
      setExpressionError();
    }

    resetExpression();
  }

  @action
  void ee() {
    try {
      String powerExpression =
          _expression.substring(_expression.lastIndexOf('^') + 1);
      double power = double.parse(powerExpression);
      double result = double.parse(_expression) * math.pow(10, power);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void sineh() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _sinh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void cosineh() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _cosh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void tangenth() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      double value = exp.evaluate(EvaluationType.REAL, ContextModel());
      double result = _tanh(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }
  }

  @action
  void pi() {
    double piValue = math.pi;
    setExpression('$piValue');
  }

  @action
  void rand() {
    String expression = math.Random().nextDouble().toString();
    setExpression(expression);
  }

  @action
  void appendText(String newText) {
    // if (isResetExpression) {
    //   setExpression('');
    //   setResetExpression(false);
    // }

    // String expression = _expression;

    // if (isPowerEnabled || isCustomRootEnabled || isLogSubscriptYEnabled) {
    //   expression += newText;
    // } else {
    //   expression = (expression == '0') ? newText : expression + newText;
    // }

    // setExpression(expression);

    if (isPowerEnabled) {
      if (isResetExpression) {
        clearExpression();
        setResetExpression(false);
      }

      setExpression(_expression + newText);
      return;
    }

    if (isCustomRootEnabled) {
      if (isResetExpression) {
        clearExpression();
        setResetExpression(false);
      }

      setExpression(_expression + newText);
      return;
    }

    if (isLogSubscriptYEnabled) {
      if (isResetExpression) {
        clearExpression();
        setResetExpression(false);
      }

      setExpression(_expression + newText);
      return;
    }

    _expression = (_expression == '0') ? newText : _expression + newText;
  }

  @action
  void calculatePower() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      String originalExpression = _expression;

      resetExpression();
      double yValue = double.parse(originalExpression);

      setYValue(yValue);

      print('xValue = $_xValue');

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(_xValue));
      cm.bindVariable(Variable('y'), Number(_yValue));

      String expression = 'x^y';

      exp = p.parse(expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String stringResult =
          _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(stringResult);
    } catch (e) {
      setExpressionError();
    }

    setXValue(0.0);
    setYValue(0.0);

    setPower(false);
  }

  @action
  void calculateExponential() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(xValue));

      setExpression('e^($exp)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    setXValue(0.0);
    setYValue(0.0);
    setExponential(false);
  }

  @action
  void calculateTenToPowerX() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(xValue));

      setExpression('10^($exp)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    setXValue(0.0);
    setYValue(0.0);
    setTenToPowerX(false);
  }

  @action
  void calculateTwoToPowerX() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('x'), Number(xValue));

      setExpression('2^($exp)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    setXValue(0.0);
    setYValue(0.0);
    setTwoToPowerX(false);
  }

  @action
  void calculateCustomRoot() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);

      ContextModel cm = ContextModel();
      cm.bindVariable(Variable('y'), Number(yValue));

      setExpression('(y)^(1/$exp)');

      exp = p.parse(_expression);

      double result = exp.evaluate(EvaluationType.REAL, cm);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      resetExpression();
    }

    setXValue(0.0);
    setCustomRoot(false);
    resetExpression();
  }

  @action
  void calculateLogSubscriptY() {
    try {
      double value = double.parse(_expression);
      double result = math.log(yValue) / math.log(value);
      String expression = _isInt(result) ? '$result'.split('.')[0] : '$result';

      setExpression(expression);
    } catch (e) {
      setExpressionError();
    }

    setXValue(0.0);
    setLogSubscriptY(false);
    resetExpression();
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
