import 'dart:io';
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
  static const Color operatorButtonBgColor = Colors.orange;
  static const Color specialButtonBgColor = Color(0xFF9B9B9B);

  String _expression = '0';
  bool _secondScheme = false;
  bool _resetExpression = false;

  bool _isPowerEnabled = false;
  bool _isExponentialEnabled = false;
  bool _isTenToPowerXEnabled = false;

  double _xValue = 0.0;
  double _yValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onButtonPressed(String text) {
    setState(() {
      switch (text) {
        // portrait
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
        // landscape
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
          exponential();
          break;
        case '10^x':
          tenToPowerX();
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

  void exponential() {
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

        _expression = '$result'.split('.')[0].length > 1
            ? '$result'.split('.')[0]
            : '$result';
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

  bool _isInt(num value, {double epsilon = 1e-10}) {
    return value is int || (value - value.roundToDouble()).abs() < epsilon;
  }

  String _getExpression() {
    return _expression;
  }

  Widget _textWidget(String text, TextStyle style) {
    return FittedBox(
      fit: BoxFit.contain,
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
      fit: BoxFit.contain,
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
      fit: BoxFit.contain,
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
    Orientation orientation = MediaQuery.of(context).orientation;
    bool isPortrait = orientation == Orientation.portrait;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonWidth = isPortrait ? screenWidth / 4 : screenWidth / 11.0;
    double buttonHeight =
        isPortrait ? screenWidth / 4 : (screenHeight - 100.0) / 5.0;

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
    Orientation orientation = MediaQuery.of(context).orientation;
    bool isIOS = Platform.isIOS;
    bool isLandscape = orientation == Orientation.landscape;
    bool isPortrait = orientation == Orientation.portrait;
    double iconSize = isPortrait ? 30.0 : 20.0;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = GoogleFonts.roboto(
        textStyle: TextStyle(
            fontSize: isPortrait ? 38.0 : 26.0,
            fontWeight: FontWeight.w400,
            color: buttonTextColor));

    List<Widget> landscapeButtonListRow1 = isLandscape
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
                'mr', _textWidget('mr', textStyle), buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow2 = isLandscape
        ? <Widget>[
            _actionButtonWidget('2nd', _topTextWidget('2', 'nd', textStyle),
                _secondScheme ? specialButtonBgColor : buttonAditionalBgColor),
            _actionButtonWidget('x^2', _topTextWidget('x', '2', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget('x^3', _topTextWidget('x', '3', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(
                'x^y',
                _topTextWidget('x', 'y', textStyle),
                _isPowerEnabled
                    ? specialButtonBgColor
                    : buttonAditionalBgColor),
            _actionButtonWidget('e^x', _topTextWidget('e', 'x', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget('10^x', _topTextWidget('10', 'x', textStyle),
                buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow3 = isLandscape
        ? <Widget>[
            _actionButtonWidget(
                '(', _textWidget('1/x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('2√x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('3√x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('y√x', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('ln', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(')', _bottomTextWidget('log', '10', textStyle),
                buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow4 = isLandscape
        ? <Widget>[
            _actionButtonWidget(
                '(', _textWidget('x!', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('sin', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('cos', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('tan', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('e', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('EE', textStyle), buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow5 = isLandscape
        ? <Widget>[
            _actionButtonWidget(
                '(', _textWidget('Rad', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('sinh', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('cosh', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('tanh', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('\u03C0', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('Rand', textStyle), buttonAditionalBgColor),
          ]
        : <Widget>[];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 100.0,
              padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? (screenWidth / 11.0) / 2 : 16.0),
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
            height: isIOS ? 30.0 : 15.0,
          ),
        ],
      ),
    );
  }
}
