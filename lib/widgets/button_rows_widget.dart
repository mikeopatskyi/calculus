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

  // ButtonsRowsWidget({super.key});

  void _onButtonPressed(String text) {
    switch (text) {
      // PORTRAIT
      case 'AC':
        calculatorStore.clearExpression();
        break;
      case 'C':
        calculatorStore.backspace();
      case '±':
        calculatorStore.changeSign();
        break;
      case '=':
        calculatorStore.evaluateExpression();
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
      // LANDSCAPE
      // row #1
      case 'mc':
        calculatorStore.clearMemory();
        break;
      case 'm+':
        calculatorStore.addToMemory();
        break;
      case 'm-':
        calculatorStore.subtractFromMemory();
        break;
      case 'mr':
        calculatorStore.recallMemory();
        break;
      // row #2
      case '1st':
      case '2nd':
        calculatorStore.changeScheme();
        break;
      case 'x^3':
        calculatorStore.cube();
        break;
      case 'x^2':
        calculatorStore.square();
        break;
      case 'x^y':
        calculatorStore.power();
        break;
      case 'e^x':
        calculatorStore.exponentialPower();
        break;
      case '10^x':
        calculatorStore.tenToPowerX();
        break;
      case '2^x':
        calculatorStore.twoToPowerX();
        break;
      // row #3
      case '1/x':
        calculatorStore.reciprocal();
        break;
      case 'sqrt[2]{x}':
        calculatorStore.squareRootSquare();
        break;
      case 'sqrt[3]{x}':
        calculatorStore.cubeRootSquare();
        break;
      case 'sqrt[y]{x}':
        calculatorStore.customRoot();
        break;
      case 'ln':
        calculatorStore.ln();
        break;
      case 'log_2':
        calculatorStore.logSubscript2();
        break;
      case 'log_10':
        calculatorStore.logSubscript10();
        break;
      case 'log_y':
        calculatorStore.logSubscriptY();
        break;
      // row #4
      case 'x!':
        calculatorStore.factorial();
        break;
      case 'sin':
        calculatorStore.sine();
        break;
      case 'cos':
        calculatorStore.cosine();
        break;
      case 'tan':
        calculatorStore.tangent();
        break;
      case 'e':
        calculatorStore.exponential();
        break;
      case 'EE':
        calculatorStore.ee();
        break;
      // row #5
      case 'rad':
      case 'deg':
        calculatorStore.toggleAngleMode();
        break;
      case 'sinh':
        calculatorStore.sineh();
        break;
      case 'cosh':
        calculatorStore.cosineh();
        break;
      case 'tanh':
        calculatorStore.tangenth();
        break;
      case 'pi':
        calculatorStore.pi();
        break;
      case 'rand':
        calculatorStore.rand();
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

  Widget _subscriptTextWidget(String text, String childText, TextStyle style) {
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

    List<Widget> landscapeButtonListRow1 = isLandscape
        ? <Widget>[
            _actionButtonWidget(
              '(',
              _textWidget('(', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              ')',
              _textWidget(')', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'mc',
              _textWidget('mc', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'm+',
              _textWidget('m+', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'm-',
              _textWidget('m-', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            Observer(builder: (_) {
              return _actionButtonWidget(
                'mr',
                _textWidget('mr', textStyle),
                calculatorStore.isMemoryEnabled
                    ? AppColors.buttonSwitcherActiveBgColor
                    : AppColors.buttonAdditionalBgColor,
              );
            })
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow2 = isLandscape
        ? <Widget>[
            Observer(builder: (_) {
              return _actionButtonWidget(
                  calculatorStore.isSecondScheme ? '1st' : '2nd',
                  calculatorStore.isSecondScheme
                      ? _powerTextWidget('1', 'st', textStyle)
                      : _powerTextWidget('2', 'nd', textStyle),
                  AppColors.buttonAdditionalBgColor);
            }),
            _actionButtonWidget('x^2', _powerTextWidget('x', '2', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('x^3', _powerTextWidget('x', '3', textStyle),
                AppColors.buttonAdditionalBgColor),
            Observer(builder: (_) {
              return _actionButtonWidget(
                'x^y',
                _powerTextWidget('x', 'y', textStyle),
                calculatorStore.isPowerEnabled
                    ? AppColors.buttonSwitcherActiveBgColor
                    : AppColors.buttonAdditionalBgColor,
              );
            }),
            _actionButtonWidget('e^x', _powerTextWidget('e', 'x', textStyle),
                AppColors.buttonAdditionalBgColor),
            Observer(builder: (_) {
              return _actionButtonWidget(
                calculatorStore.isSecondScheme ? '2^x' : '10^x',
                calculatorStore.isSecondScheme
                    ? _powerTextWidget('2', 'x', textStyle)
                    : _powerTextWidget('10', 'x', textStyle),
                AppColors.buttonAdditionalBgColor,
              );
            }),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow3 = isLandscape
        ? <Widget>[
            _actionButtonWidget(
              '1/x',
              _textWidget('1/x', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'sqrt[2]{x}',
              _rootPowerTextWidget('√x', '2', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'sqrt[3]{x}',
              _rootPowerTextWidget('√x', '3', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            Observer(builder: (_) {
              return _actionButtonWidget(
                'sqrt[y]{x}',
                _rootPowerTextWidget('√x', 'y', textStyle),
                calculatorStore.isCustomRootEnabled
                    ? AppColors.buttonSwitcherActiveBgColor
                    : AppColors.buttonAdditionalBgColor,
              );
            }),
            Observer(builder: (_) {
              return _actionButtonWidget(
                calculatorStore.isSecondScheme ? 'log_y' : 'ln',
                calculatorStore.isSecondScheme
                    ? _subscriptTextWidget('log', 'y', textStyle)
                    : _textWidget('ln', textStyle),
                AppColors.buttonAdditionalBgColor,
              );
            }),
            Observer(builder: (_) {
              return _actionButtonWidget(
                calculatorStore.isSecondScheme ? 'log_2' : 'log_10',
                calculatorStore.isSecondScheme
                    ? _subscriptTextWidget('log', '2', textStyle)
                    : _subscriptTextWidget('log', '10', textStyle),
                AppColors.buttonAdditionalBgColor,
              );
            }),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow4 = isLandscape
        ? <Widget>[
            _actionButtonWidget(
              'x!',
              _textWidget('x!', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'sin',
              _textWidget('sin', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'cos',
              _textWidget('cos', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'tan',
              _textWidget('tan', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'e',
              _textWidget('e', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'EE',
              _textWidget('EE', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow5 = isLandscape
        ? <Widget>[
            Observer(builder: (_) {
              return _actionButtonWidget(
                calculatorStore.isAngleModeEnabled ? 'deg' : 'rad',
                _textWidget(calculatorStore.isAngleModeEnabled ? 'Deg' : 'Rad',
                    textStyle),
                AppColors.buttonAdditionalBgColor,
              );
            }),
            _actionButtonWidget(
              'sinh',
              _textWidget('sinh', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'cosh',
              _textWidget('cosh', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'tanh',
              _textWidget('tanh', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'pi',
              _textWidget('\u03C0', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              'rand',
              _textWidget('Rand', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
          ]
        : <Widget>[];

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...landscapeButtonListRow1,
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
            ...landscapeButtonListRow2,
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
            ...landscapeButtonListRow3,
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
            ...landscapeButtonListRow4,
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
            ...landscapeButtonListRow5,
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
