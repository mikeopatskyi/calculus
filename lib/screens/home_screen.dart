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

  void _onButtonPressed(String text) {
    setState(() {
      switch (text) {
        case 'AC':
          clearExpression();
          break;
        case 'C':
          backspace();
        case '±':
          changeSign();
          break;
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
        default:
          appendText(text);
          break;
      }
    });
  }

  void clearExpression() {
    _expression = '0';
  }

  void backspace() {
    _expression = _expression.length > 1
        ? _expression.substring(0, _expression.length - 1)
        : '0';
  }

  void changeSign() {
    if (_expression != '0') {
      if (_expression.startsWith('-')) {
        _expression = _expression.substring(1);
      } else {
        _expression = '-' + _expression;
      }
    }
  }

  void evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();

      var result = exp.evaluate(EvaluationType.REAL, cm);

      if (result % 1 == 0) {
        _expression = '$result'.split('.')[0];
      } else {
        _expression = '$result';
      }
    } catch (e) {
      _expression = 'Error';
    }
  }

  void applyPercentage() {
    try {
      _expression += '/100';
      evaluateExpression();
    } catch (e) {
      _expression = 'Error';
    }
  }

  void appendOperator(String operator) {
    _expression += ' $operator ';
  }

  void addDecimalPoint() {
    if (!_expression.contains('.')) {
      _expression += '.';
    }
  }

  void appendText(String newText) {
    _expression = (_expression == '0') ? newText : _expression + newText;
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
                ')', _textWidget('mc', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('m+', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('m-', textStyle), buttonAditionalBgColor),
            _actionButtonWidget(
                ')', _textWidget('mr', textStyle), buttonAditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow2 = isLandscape
        ? <Widget>[
            _actionButtonWidget('(', _topTextWidget('2', 'nd', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(')', _topTextWidget('x', '2', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(')', _topTextWidget('x', '3', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(')', _topTextWidget('x', 'y', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(')', _topTextWidget('e', 'x', textStyle),
                buttonAditionalBgColor),
            _actionButtonWidget(')', _topTextWidget('10', 'x', textStyle),
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
              child: FittedBox(
                child: Text(
                  _expression,
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
