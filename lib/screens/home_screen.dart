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
  static const Color buttonBackgroundColor = Color(0xFF2D2D2D);
  static const Color buttonTextColor = Colors.white;
  static const Color operatorButtonBackgroundColor = Colors.orange;
  static const Color specialButtonBackgroundColor = Color(0xFF9B9B9B);

  late final TextStyle baseTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 38.0, fontWeight: FontWeight.w400, color: buttonTextColor));

  String _expression = '0';

  void _onButtonPressed(String text) {
    setState(() {
      switch (text) {
        case 'AC':
          clearExpression();
          break;
        case 'C':
          backspace();
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

  void evaluateExpression() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      _expression = '${exp.evaluate(EvaluationType.REAL, cm)}';
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

  Widget _actionButton(
      String buttonText, Widget buttonWidget, Color backgroundColor,
      [double fraction = 0.25]) {
    double size = MediaQuery.of(context).size.width * fraction;

    return SizedBox(
      width: size,
      height: fraction == 0.25 ? size : size / 2,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0.0,
          ),
          child: buttonWidget,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _actionButton('AC', _textWidget('AC', baseTextStyle),
                        specialButtonBackgroundColor),
                    _actionButton('C', _textWidget('C', baseTextStyle),
                        specialButtonBackgroundColor),
                    _actionButton(
                        '%',
                        const FaIcon(FontAwesomeIcons.percent,
                            color: buttonTextColor, size: 30.0),
                        specialButtonBackgroundColor),
                    _actionButton(
                        '/',
                        const FaIcon(FontAwesomeIcons.divide,
                            color: buttonTextColor, size: 30.0),
                        operatorButtonBackgroundColor),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _actionButton('7', _textWidget('7', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton('8', _textWidget('8', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton('9', _textWidget('9', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton(
                        '*',
                        const FaIcon(FontAwesomeIcons.xmark,
                            color: Colors.white, size: 32.0),
                        Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _actionButton('4', _textWidget('4', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton('5', _textWidget('5', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton('6', _textWidget('6', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton(
                        '-',
                        const FaIcon(FontAwesomeIcons.minus,
                            color: Colors.white, size: 30.0),
                        Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _actionButton('1', _textWidget('1', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton('2', _textWidget('2', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton('3', _textWidget('3', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton(
                        '+',
                        const FaIcon(FontAwesomeIcons.plus,
                            color: Colors.white, size: 30.0),
                        Colors.orange),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _actionButton('0', _textWidget('0', baseTextStyle),
                        buttonBackgroundColor, 0.5),
                    _actionButton('.', _textWidget('.', baseTextStyle),
                        buttonBackgroundColor),
                    _actionButton(
                        '=',
                        const FaIcon(FontAwesomeIcons.equals,
                            color: Colors.white, size: 30.0),
                        Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
