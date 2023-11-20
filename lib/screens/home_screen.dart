import 'dart:io';
import 'dart:math';
import 'dart:math' as math;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color buttonBgColor = Color(0xFF2D2D2D);
  static const Color buttonTextColor = Colors.white;
  static const Color buttonAditionalBgColor = Color(0xFF212121);
  static const Color buttonSwitcherActiveBgColor = Color(0xFF7F7F7F);
  static const Color operatorButtonBgColor = Colors.orange;
  static const Color specialButtonBgColor = Color(0xFF9B9B9B);

  bool _isSmartphone = true;

  String _expression = '0';
  double _memoryValue = 0.0;
  bool _secondScheme = false;
  bool _resetExpression = false;

  bool _isMemoryEnabled = false;
  bool _isPowerEnabled = false;
  bool _isExponentialEnabled = false;
  bool _isTenToPowerXEnabled = false;
  bool _isCustomRootEnabled = false;
  bool _isAngleModeEnabled = false;

  double _xValue = 0.0;
  double _yValue = 0.0;

  @override
  void initState() {
    super.initState();
    _setInitialValues();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setInitialValues() {
    _expression = '0';
    _memoryValue = 0.0;
    _secondScheme = false;
    _resetExpression = false;

    _isSmartphone = true;

    _isMemoryEnabled = false;
    _isPowerEnabled = false;
    _isExponentialEnabled = false;
    _isTenToPowerXEnabled = false;
    _isCustomRootEnabled = false;
    _isAngleModeEnabled = false;

    _xValue = 0.0;
    _yValue = 0.0;
  }

  void _onButtonPressed(String text) {
    setState(() {
      switch (text) {
        // PORTRAIT
        case 'AC':
          clearExpression();
          break;
        case 'C':
          backspace();
        case '±':
          changeSign();
          break;
        case '=':
          evaluateExpression();
          break;
        case '%':
          applyPercentage();
          break;
        case '+':
        case '-':
        case '*':
        case '/':
          appendOperator(text);
          break;
        case '.':
          addDecimalPoint();
          break;
        // LANDSCAPE
        // row #1
        case 'mc':
          clearMemory();
          break;
        case 'm+':
          addToMemory();
          break;
        case 'm-':
          subtractFromMemory();
          break;
        case 'mr':
          recallMemory();
          break;
        // row #2
        case '1st':
        case '2nd':
          changeScheme();
          break;
        case 'x^3':
          cube();
          break;
        case 'x^y':
          power();
          break;
        case 'e^x':
          exponentialPower();
          break;
        case '10^x':
          tenToPowerX();
          break;
        // row #3
        case '1/x':
          reciprocal();
          break;
        case '^2√x':
          squareRootSquare();
          break;
        case '^3√x':
          cubeRootSquare();
          break;
        case '^y√x':
          customRoot();
          break;
        case 'ln':
          ln();
          break;
        case 'log_10':
          logSubscript10();
          break;
        // row #4
        case 'x!':
          factorial();
          break;
        case 'sin':
          sine();
          break;
        case 'cos':
          cosine();
          break;
        case 'tan':
          tangent();
          break;
        case 'e':
          exponential();
          break;
        case 'EE':
          ee();
          break;
        // row #5
        case 'rad':
        case 'deg':
          setAngleMode();
          break;
        case 'sinh':
          sineh();
          break;
        case 'cosh':
          cosineh();
          break;
        case 'tanh':
          tangenth();
          break;
        case 'pi':
          pi();
          break;
        case 'rand':
          rand();
          break;
        default:
          appendText(text);
          break;
      }
    });
  }

  void _onSwipeLeftAction() {
    setState(() {
      _expression = _expression.length > 1 ? _expression.substring(1) : '0';
    });
  }

  void _onSwipeRightAction() {
    setState(() {
      _expression = _expression.length > 1
          ? _expression.substring(0, _expression.length - 1)
          : '0';
    });
  }

  void clearExpression() {
    setState(() {
      _expression = '0';

      _isPowerEnabled = false;
      _isExponentialEnabled = false;
      _isTenToPowerXEnabled = false;
      _isCustomRootEnabled = false;

      _xValue = 0.0;
      _yValue = 0.0;
    });
  }

  void backspace() {
    setState(() {
      _expression = _expression.length > 1
          ? _expression.substring(0, _expression.length - 1)
          : '0';

      _isPowerEnabled = false;
      _isExponentialEnabled = false;
      _isTenToPowerXEnabled = false;
      _isCustomRootEnabled = false;

      _xValue = 0.0;
      _yValue = 0.0;
    });
  }

  void changeSign() {
    setState(() {
      if (_expression != '0') {
        _expression = _expression.startsWith('-')
            ? _expression.substring(1)
            : '-$_expression';
      }
    });
  }

  void evaluateExpression() {
    if (_isPowerEnabled) {
      calculatePower();
      return;
    }

    if (_isExponentialEnabled) {
      calculateExponential();
      return;
    }

    if (_isTenToPowerXEnabled) {
      calculateTenToPowerX();
      return;
    }

    if (_isCustomRootEnabled) {
      calculateCustomRoot();
      return;
    }

    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void applyPercentage() {
    setState(() {
      try {
        _expression += '/100';
        evaluateExpression();
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void appendOperator(String operator) {
    setState(() {
      _expression += operator;
    });
  }

  void addDecimalPoint() {
    setState(() {
      if (!_expression.contains('.')) {
        _expression += '.';
      }
    });
  }

  void clearMemory() {
    setState(() {
      _isMemoryEnabled = false;
      _memoryValue = 0.0;
    });
  }

  void addToMemory() {
    setState(() {
      _isMemoryEnabled = true;
      _memoryValue += double.parse(_expression);
    });
  }

  void subtractFromMemory() {
    setState(() {
      _isMemoryEnabled = true;
      _memoryValue -= double.parse(_expression);
    });
  }

  void recallMemory() {
    setState(() {
      _isMemoryEnabled = true;
      _expression = _isInt(_memoryValue)
          ? '$_memoryValue'.split('.')[0]
          : '$_memoryValue';
    });
  }

  void changeScheme() {
    setState(() {
      _secondScheme = !_secondScheme;
    });
  }

  void square() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();

        cm.bindVariable(Variable('x'), Number(0));

        _expression = '($exp)^2';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void cube() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(0));

        _expression = '($exp)^3';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void power() {
    setState(() {
      _isPowerEnabled = !_isPowerEnabled;
      _xValue = double.parse(_expression);
      _resetExpression = !_resetExpression;
    });
  }

  void exponentialPower() {
    setState(() {
      try {
        _isExponentialEnabled = !_isExponentialEnabled;
        _xValue = double.parse(_expression);
        evaluateExpression();
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void tenToPowerX() {
    setState(() {
      try {
        _isTenToPowerXEnabled = true;
        _xValue = double.parse(_expression);
        evaluateExpression();
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void reciprocal() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();

        _expression = '1/($exp)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void squareRootSquare() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();

        _expression = '($exp)^(1/2)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void cubeRootSquare() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();

        _expression = '($exp)^(1/3)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void customRoot() {
    setState(() {
      _isCustomRootEnabled = !_isCustomRootEnabled;
      _yValue = double.parse(_expression);
      _resetExpression = !_resetExpression;
    });
  }

  void ln() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        ContextModel cm = ContextModel();
        _expression = 'ln($exp)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void logSubscript10() {
    setState(() {
      try {
        double value = double.parse(_expression);
        double result = log(value) / ln10;

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void factorial() {
    setState(() {
      try {
        int value = int.parse(_expression);
        if (value < 0) {
          _expression = 'Error';
          return;
        }

        int result = 1;
        for (int i = 2; i <= value; i++) {
          result *= i;
        }

        _expression = '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void sine() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(0));
        _expression = 'sin($exp)';
        exp = p.parse(_expression);
        var result = exp.evaluate(EvaluationType.REAL, cm);
        _expression = '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void cosine() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(0));
        _expression = 'cos($exp)';
        exp = p.parse(_expression);
        var result = exp.evaluate(EvaluationType.REAL, cm);
        _expression = '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void tangent() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(0));
        _expression = 'tan($exp)';
        exp = p.parse(_expression);
        var result = exp.evaluate(EvaluationType.REAL, cm);
        _expression = '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void exponential() {
    setState(() {
      try {
        double eValue = exp(1);

        _expression = '$eValue';
      } catch (e) {
        _expression = 'Error';
      }

      _resetExpression = false;
    });
  }

  void ee() {
    setState(() {
      try {
        String powerExpression =
            _expression.substring(_expression.lastIndexOf('^') + 1);
        double power = double.parse(powerExpression);
        double result = double.parse(_expression) * pow(10, power);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void setAngleMode() {
    setState(() {
      _isAngleModeEnabled = !_isAngleModeEnabled;
    });
  }

  void sineh() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        double value = exp.evaluate(EvaluationType.REAL, ContextModel());
        double result = _sinh(value);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void cosineh() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        double value = exp.evaluate(EvaluationType.REAL, ContextModel());
        double result = _cosh(value);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void tangenth() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        double value = exp.evaluate(EvaluationType.REAL, ContextModel());
        double result = _tanh(value);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }
    });
  }

  void pi() {
    setState(() {
      double piValue = math.pi;
      _expression = '$piValue';
    });
  }

  void rand() {
    setState(() {
      _expression = Random().nextDouble().toString();
    });
  }

  void appendText(String newText) {
    setState(() {
      if (_isPowerEnabled) {
        if (_resetExpression) {
          _expression = '';
          _resetExpression = false;
        }

        _expression += newText;
        return;
      }

      if (_isCustomRootEnabled) {
        if (_resetExpression) {
          _expression = '';
          _resetExpression = false;
        }

        _expression += newText;
        return;
      }

      _expression = (_expression == '0') ? newText : _expression + newText;
    });
  }

  void calculatePower() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        String originalExpression = _expression;

        _expression = '0';
        _yValue = double.parse(originalExpression);

        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(_xValue));
        cm.bindVariable(Variable('y'), Number(_yValue));

        _expression = 'x^y';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _xValue = 0.0;
      _yValue = 0.0;
      _isPowerEnabled = false;
      _resetExpression = false;
    });
  }

  void calculateExponential() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(_xValue));

        _expression = 'e^($exp)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _xValue = 0.0;
      _yValue = 0.0;
      _isExponentialEnabled = false;
    });
  }

  void calculateTenToPowerX() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('x'), Number(_xValue));

        _expression = '10^($exp)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _xValue = 0.0;
      _yValue = 0.0;
      _isTenToPowerXEnabled = false;
    });
  }

  void calculateCustomRoot() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);

        ContextModel cm = ContextModel();
        cm.bindVariable(Variable('y'), Number(_yValue));

        _expression = '(y)^(1/$exp)';

        exp = p.parse(_expression);

        var result = exp.evaluate(EvaluationType.REAL, cm);

        _expression = _isInt(result) ? '$result'.split('.')[0] : '$result';
      } catch (e) {
        _expression = 'Error';
      }

      _xValue = 0.0;
      _isCustomRootEnabled = false;
      _resetExpression = false;
    });
  }

  double _sinh(double x) {
    return (exp(x) - exp(-x)) / 2;
  }

  double _cosh(double x) {
    return (exp(x) + exp(-x)) / 2;
  }

  double _tanh(double x) {
    double ex = exp(x);
    double eMinusX = exp(-x);
    return (ex - eMinusX) / (ex + eMinusX);
  }

  bool _isInt(num value, {double epsilon = 1e-10}) {
    return value is int || (value - value.roundToDouble()).abs() < epsilon;
  }

  bool _isAndroid() {
    return Platform.isAndroid;
  }

  bool _isIOS() {
    return Platform.isIOS;
  }

  bool _isPortrait() {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  bool _isLandscape() {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  double _getScreenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double _getScreenHeight() {
    return MediaQuery.of(context).size.height;
  }

  Future<void> checkSmartphone() async {
    var platform = Theme.of(context).platform;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    setState(() {
      _isSmartphone = true;
    });

    if (platform == TargetPlatform.android) {
      // Check if the device is a smartphone based on screen width and height

      // Define a threshold to differentiate between smartphones and tablets
      double threshold = 600.0;

      // Update isSmartphone based on the screen size
      setState(() {
        _isSmartphone = screenWidth < threshold || screenHeight < threshold;
      });
    } else if (platform == TargetPlatform.iOS) {
      // Check if the device is a smartphone based on screen width and height

      // Define a threshold to differentiate between smartphones and tablets
      double threshold = 600.0;

      // Update isSmartphone based on the screen size
      setState(() {
        _isSmartphone = screenWidth < threshold || screenHeight < threshold;
      });
    } else {
      // For other platforms, you may need to implement similar logic.
      setState(() {
        _isSmartphone = false;
      });
    }
  }

  String _getExpression() {
    return _expression;
  }

  Widget _textWidget(String text, TextStyle style) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
        softWrap: true,
      ),
    );
  }

  Widget _topTextWidget(String text, String childText, TextStyle style) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: style,
          ),
          Baseline(
            baseline: 0,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              childText,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomTextWidget(String text, String childText, TextStyle style) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Center(
        child: RichText(
          text: TextSpan(
            text: text,
            style: style,
            children: <TextSpan>[
              TextSpan(
                text: childText,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButtonWidget(
      String buttonText, Widget buttonWidget, Color bgColor) {
    bool isPortrait = _isPortrait();
    double screenWidth = _getScreenWidth();

    var buttonWidth = 0.0;
    var buttonHeight = 0.0;

    if (_isSmartphone) {
      buttonWidth = isPortrait ? screenWidth / 4.0 : screenWidth / 10.5;
      buttonHeight =
          isPortrait ? screenWidth / 4.0 : (screenWidth - 100.0) / 16.0;
    }

    if (!_isSmartphone) {
      buttonWidth = isPortrait ? screenWidth / 4.0 : screenWidth / 10.5;
      buttonHeight =
          isPortrait ? screenWidth / 8.0 : (screenWidth - 100.0) / 16.0;
    }

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            elevation: 0.0,
          ),
          child: buttonWidget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    checkSmartphone();

    bool isPortrait = _isPortrait();
    bool isIOS = _isIOS();
    double screenWidth = _getScreenWidth();

    double iconSize = isPortrait ? 30.0 : 20.0;
    double expressionPaddingX = isPortrait ? 16.0 : (screenWidth / 11.0) / 3;
    double expressionPaddingY = isPortrait ? 00.0 : 20.0;
    TextStyle textStyle = GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: isPortrait ? 38.0 : 26.0,
            fontWeight: FontWeight.w400,
            color: buttonTextColor));

    List<Widget> landscapeButtonListRow1 = _isLandscape()
        ? <Widget>[
            _actionButtonWidget(
                '(', _textWidget('(', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget(')', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'mc', _textWidget('mc', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'm+', _textWidget('m+', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'm-', _textWidget('m-', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'mr',
                _textWidget('mr', textStyle),
                _isMemoryEnabled
                    ? buttonSwitcherActiveBgColor
                    : buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow2 = _isLandscape()
        ? <Widget>[
            _actionButtonWidget(
                _secondScheme ? '1st' : '2nd',
                _secondScheme
                    ? _topTextWidget('1', 'st', textStyle)
                    : _topTextWidget('2', 'nd', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget('x^2', _topTextWidget('x', '2', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget('x^3', _topTextWidget('x', '3', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(
                'x^y',
                _topTextWidget('x', 'y', textStyle),
                _isPowerEnabled
                    ? buttonSwitcherActiveBgColor
                    : buttonAditionalBgColor),
            _actionButtonWidget('e^x', _topTextWidget('e', 'x', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget('10^x', _topTextWidget('10', 'x', textStyle),
                buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow3 = _isLandscape()
        ? <Widget>[
            _actionButtonWidget(
                '1/x', _textWidget('1/x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                '^2√x', _textWidget('2√x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                '^3√x', _textWidget('3√x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                '^y√x',
                _textWidget('y√x', textStyle),
                _isCustomRootEnabled
                    ? buttonSwitcherActiveBgColor
                    : buttonAditionalBgColor),
            _actionButtonWidget(
                'ln', _textWidget('ln', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'log_10',
                _bottomTextWidget('log', '10', textStyle),
                buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow4 = _isLandscape()
        ? <Widget>[
            _actionButtonWidget(
                'x!', _textWidget('x!', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'sin', _textWidget('sin', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'cos', _textWidget('cos', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'tan', _textWidget('tan', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'e', _textWidget('e', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'EE', _textWidget('EE', textStyle), buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow5 = _isLandscape()
        ? <Widget>[
            _actionButtonWidget(
                _isAngleModeEnabled ? 'deg' : 'rad',
                _textWidget(_isAngleModeEnabled ? 'Deg' : 'Rad', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(
                'sinh', _textWidget('sinh', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'cosh', _textWidget('cosh', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'tanh', _textWidget('tanh', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'pi', _textWidget('\u03C0', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                'rand', _textWidget('Rand', textStyle), buttonAditionalBgColor),
          ]
        : <Widget>[];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 100.0,
              padding: EdgeInsets.only(
                left: expressionPaddingX,
                right: expressionPaddingX,
                top: expressionPaddingY,
              ),
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    _onSwipeRightAction();
                  } else if (details.primaryVelocity! < 0) {
                    _onSwipeLeftAction();
                  }
                },
                child: FittedBox(
                  child: Text(
                    _getExpression(),
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 98.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...landscapeButtonListRow1,
                  _actionButtonWidget(
                      'AC', _textWidget('AC', textStyle), specialButtonBgColor),
                  _actionButtonWidget(
                      'C', _textWidget('C', textStyle), specialButtonBgColor),
                  _actionButtonWidget(
                      '±',
                      FaIcon(FontAwesomeIcons.plusMinus,
                          color: buttonTextColor, size: iconSize),
                      specialButtonBgColor),
                  _actionButtonWidget(
                      '/',
                      FaIcon(FontAwesomeIcons.divide,
                          color: buttonTextColor, size: iconSize),
                      operatorButtonBgColor),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...landscapeButtonListRow2,
                  _actionButtonWidget(
                      '7', _textWidget('7', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '8', _textWidget('8', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '9', _textWidget('9', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '*',
                      FaIcon(FontAwesomeIcons.xmark,
                          color: Colors.white, size: iconSize),
                      Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...landscapeButtonListRow3,
                  _actionButtonWidget(
                      '4', _textWidget('4', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '5', _textWidget('5', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '6', _textWidget('6', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '-',
                      FaIcon(FontAwesomeIcons.minus,
                          color: Colors.white, size: iconSize),
                      Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...landscapeButtonListRow4,
                  _actionButtonWidget(
                      '1', _textWidget('1', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '2', _textWidget('2', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '3', _textWidget('3', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '+',
                      FaIcon(FontAwesomeIcons.plus,
                          color: Colors.white, size: iconSize),
                      Colors.orange),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ...landscapeButtonListRow5,
                  _actionButtonWidget(
                      '0', _textWidget('0', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '.', _textWidget('.', textStyle), buttonBgColor),
                  _actionButtonWidget(
                      '%',
                      FaIcon(FontAwesomeIcons.percent,
                          color: buttonTextColor, size: iconSize),
                      buttonBgColor),
                  _actionButtonWidget(
                      '=',
                      FaIcon(FontAwesomeIcons.equals,
                          color: Colors.white, size: iconSize),
                      Colors.orange),
                ],
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: isIOS
                ? 30.0
                : _isSmartphone
                    ? 0.0
                    : 20.0,
          ),
        ],
      ),
    );
  }
}
