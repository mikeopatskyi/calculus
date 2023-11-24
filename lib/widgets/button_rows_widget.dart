import 'package:calculus/constants/app_colors.dart';
import 'package:calculus/store/calculator_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

final calculatorStore = CalculatorStore.getInstance();

class ButtonsRowsWidget extends StatelessWidget {
  final bool isSmartphone;
  final bool isPortrait;
  final bool isLandscape;

  final double screenWidth;
  final double screenHeight;

  const ButtonsRowsWidget({
    super.key,
    required this.isSmartphone,
    required this.isPortrait,
    required this.isLandscape,
    required this.screenWidth,
    required this.screenHeight,
  });

  void _onButtonPressed(String text) {
    switch (text) {
      case 'AC':
        calculatorStore.clearExpression();
        break;
      case 'C':
        calculatorStore.backspace();
      case '±':
        calculatorStore.changeSign();
        break;
      case '=':
        calculatorStore.evaluate();
        break;
      case '%':
        calculatorStore.applyPercentage();
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        calculatorStore.appendOperator(text);
        break;
      case '.':
        calculatorStore.addDecimalPoint();
        break;
      default:
        calculatorStore.appendText(text);
        break;
    }
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

  Widget _powerTextWidget(String text, String childText, TextStyle style) {
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

  Widget _rootPowerTextWidget(String text, String childText, TextStyle style) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Baseline(
            baseline: 0,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              childText,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }

  Widget _actionButtonWidget(
    String buttonText,
    Widget buttonWidget,
    Color bgColor,
  ) {
    var buttonWidth = 0.0;
    var buttonHeight = 0.0;

    if (isSmartphone) {
      buttonWidth = isPortrait ? screenWidth / 4.0 : screenWidth / 10.5;
      buttonHeight =
          isPortrait ? screenWidth / 4.0 : (screenWidth - 100.0) / 16.0;
    }

    if (!isSmartphone) {
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
    double iconSize = isPortrait ? 30.0 : 20.0;
    TextStyle textStyle = GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: isPortrait ? 38.0 : 26.0,
        fontWeight: FontWeight.w400,
        color: AppColors.buttonTextColor,
      ),
    );

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _actionButtonWidget('AC', _textWidget('AC', textStyle),
                AppColors.specialButtonBgColor),
            _actionButtonWidget('C', _textWidget('C', textStyle),
                AppColors.specialButtonBgColor),
            _actionButtonWidget(
                '±',
                FaIcon(FontAwesomeIcons.plusMinus,
                    color: AppColors.buttonTextColor, size: iconSize),
                AppColors.specialButtonBgColor),
            _actionButtonWidget(
                '/',
                FaIcon(FontAwesomeIcons.divide,
                    color: AppColors.buttonTextColor, size: iconSize),
                AppColors.operatorButtonBgColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _actionButtonWidget(
                '7', _textWidget('7', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '8', _textWidget('8', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '9', _textWidget('9', textStyle), AppColors.buttonBgColor),
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
            _actionButtonWidget(
                '4', _textWidget('4', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '5', _textWidget('5', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '6', _textWidget('6', textStyle), AppColors.buttonBgColor),
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
            _actionButtonWidget(
                '1', _textWidget('1', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '2', _textWidget('2', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '3', _textWidget('3', textStyle), AppColors.buttonBgColor),
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
            _actionButtonWidget(
                '0', _textWidget('0', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '.', _textWidget('.', textStyle), AppColors.buttonBgColor),
            _actionButtonWidget(
                '%',
                FaIcon(FontAwesomeIcons.percent,
                    color: AppColors.buttonTextColor, size: iconSize),
                AppColors.buttonBgColor),
            _actionButtonWidget(
                '=',
                FaIcon(FontAwesomeIcons.equals,
                    color: Colors.white, size: iconSize),
                Colors.orange),
          ],
        ),
      ],
    );
  }
}
