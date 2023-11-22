import 'package:calculus/constants/app_colors.dart';
import 'package:calculus/services/calculator_service.dart';
import 'package:calculus/services/device_service.dart';
import 'package:calculus/store/calculator_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

final calculatorStore = CalculatorStore.getInstance();

// ignore: must_be_immutable
class ButtonsRowsWidget extends StatelessWidget {
  late final CalculatorService _calculatorService;

  late bool isSmartphone;
  late bool isPortrait;
  late bool isLandscape;

  late double screenWidth;
  late double screenHeight;

  ButtonsRowsWidget({super.key}) {
    _calculatorService = CalculatorService(calculatorStore);
  }

  void _onButtonPressed(String text) {
    switch (text) {
      // PORTRAIT
      case 'AC':
        _calculatorService.clearExpression();
        break;
      case 'C':
        _calculatorService.backspace();
      case '±':
        _calculatorService.changeSign();
        break;
      case '=':
        _calculatorService.evaluateExpression();
        break;
      case '%':
        _calculatorService.applyPercentage();
        break;
      case '+':
      case '-':
      case '*':
      case '/':
        _calculatorService.appendOperator(text);
        break;
      case '.':
        _calculatorService.addDecimalPoint();
        break;
      // LANDSCAPE
      // row #1
      case 'mc':
        _calculatorService.clearMemory();
        break;
      case 'm+':
        _calculatorService.addToMemory();
        break;
      case 'm-':
        _calculatorService.subtractFromMemory();
        break;
      case 'mr':
        _calculatorService.recallMemory();
        break;
      // row #2
      case '1st':
      case '2nd':
        _calculatorService.changeScheme();
        break;
      case 'x^3':
        _calculatorService.cube();
        break;
      case 'x^y':
        _calculatorService.power();
        break;
      case 'e^x':
        _calculatorService.exponentialPower();
        break;
      case '10^x':
        _calculatorService.tenToPowerX();
        break;
      case '2^x':
        _calculatorService.twoToPowerX();
        break;
      // row #3
      case '1/x':
        _calculatorService.reciprocal();
        break;
      case 'sqrt[2]{x}':
        _calculatorService.squareRootSquare();
        break;
      case 'sqrt[3]{x}':
        _calculatorService.cubeRootSquare();
        break;
      case 'sqrt[y]{x}':
        _calculatorService.customRoot();
        break;
      case 'ln':
        _calculatorService.ln();
        break;
      case 'log_2':
        _calculatorService.logSubscript2();
        break;
      case 'log_10':
        _calculatorService.logSubscript10();
        break;
      case 'log_y':
        _calculatorService.logSubscriptY();
        break;
      // row #4
      case 'x!':
        _calculatorService.factorial();
        break;
      case 'sin':
        _calculatorService.sine();
        break;
      case 'cos':
        _calculatorService.cosine();
        break;
      case 'tan':
        _calculatorService.tangent();
        break;
      case 'e':
        _calculatorService.exponential();
        break;
      case 'EE':
        _calculatorService.ee();
        break;
      // row #5
      case 'rad':
      case 'deg':
        _calculatorService.setAngleMode();
        break;
      case 'sinh':
        _calculatorService.sineh();
        break;
      case 'cosh':
        _calculatorService.cosineh();
        break;
      case 'tanh':
        _calculatorService.tangenth();
        break;
      case 'pi':
        _calculatorService.pi();
        break;
      case 'rand':
        _calculatorService.rand();
        break;
      default:
        _calculatorService.appendText(text);
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
    DeviceService deviceService = DeviceService(context);

    isSmartphone = deviceService.isSmartphone;
    isPortrait = deviceService.isPortrait;
    isLandscape = deviceService.isLandscape;

    screenWidth = deviceService.screenWidth;
    screenHeight = deviceService.screenHeight;

    double iconSize = deviceService.isPortrait ? 30.0 : 20.0;
    TextStyle textStyle = GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: deviceService.isPortrait ? 38.0 : 26.0,
        fontWeight: FontWeight.w400,
        color: AppColors.buttonTextColor,
      ),
    );

    List<Widget> landscapeButtonListRow1 = deviceService.isLandscape
        ? <Widget>[
            _actionButtonWidget('(', _textWidget('(', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(')', _textWidget(')', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('mc', _textWidget('mc', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('m+', _textWidget('m+', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('m-', _textWidget('m-', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(
              'mr',
              _textWidget('mr', textStyle),
              calculatorStore.isMemoryEnabled
                  ? AppColors.buttonSwitcherActiveBgColor
                  : AppColors.buttonAdditionalBgColor,
            ),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow2 = deviceService.isLandscape
        ? <Widget>[
            _actionButtonWidget(
                calculatorStore.isSecondScheme ? '1st' : '2nd',
                calculatorStore.isSecondScheme
                    ? _powerTextWidget('1', 'st', textStyle)
                    : _powerTextWidget('2', 'nd', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('x^2', _powerTextWidget('x', '2', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('x^3', _powerTextWidget('x', '3', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(
              'x^y',
              _powerTextWidget('x', 'y', textStyle),
              calculatorStore.isPowerEnabled
                  ? AppColors.buttonSwitcherActiveBgColor
                  : AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget('e^x', _powerTextWidget('e', 'x', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(
              calculatorStore.isSecondScheme ? '2^x' : '10^x',
              calculatorStore.isSecondScheme
                  ? _powerTextWidget('2', 'x', textStyle)
                  : _powerTextWidget('10', 'x', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow3 = deviceService.isLandscape
        ? <Widget>[
            _actionButtonWidget('1/x', _textWidget('1/x', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(
                'sqrt[2]{x}',
                _rootPowerTextWidget('√x', '2', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(
                'sqrt[3]{x}',
                _rootPowerTextWidget('√x', '3', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget(
              'sqrt[y]{x}',
              _rootPowerTextWidget('√x', 'y', textStyle),
              calculatorStore.isCustomRootEnabled
                  ? AppColors.buttonSwitcherActiveBgColor
                  : AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              calculatorStore.isSecondScheme ? 'log_y' : 'ln',
              calculatorStore.isSecondScheme
                  ? _subscriptTextWidget('log', 'y', textStyle)
                  : _textWidget('ln', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
            _actionButtonWidget(
              calculatorStore.isSecondScheme ? 'log_2' : 'log_10',
              calculatorStore.isSecondScheme
                  ? _subscriptTextWidget('log', '2', textStyle)
                  : _subscriptTextWidget('log', '10', textStyle),
              AppColors.buttonAdditionalBgColor,
            ),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow4 = deviceService.isLandscape
        ? <Widget>[
            _actionButtonWidget('x!', _textWidget('x!', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('sin', _textWidget('sin', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('cos', _textWidget('cos', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('tan', _textWidget('tan', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('e', _textWidget('e', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('EE', _textWidget('EE', textStyle),
                AppColors.buttonAdditionalBgColor),
          ]
        : <Widget>[];

    List<Widget> landscapeButtonListRow5 = deviceService.isLandscape
        ? <Widget>[
            _actionButtonWidget(
                calculatorStore.isAngleModeEnabled ? 'deg' : 'rad',
                _textWidget(calculatorStore.isAngleModeEnabled ? 'Deg' : 'Rad',
                    textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('sinh', _textWidget('sinh', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('cosh', _textWidget('cosh', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('tanh', _textWidget('tanh', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('pi', _textWidget('\u03C0', textStyle),
                AppColors.buttonAdditionalBgColor),
            _actionButtonWidget('rand', _textWidget('Rand', textStyle),
                AppColors.buttonAdditionalBgColor),
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
