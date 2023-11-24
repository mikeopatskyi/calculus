import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculus/store/calculator_store.dart';
import 'package:calculus/services/device_service.dart';

final calculatorStore = CalculatorStore.getInstance();

class ExpressionDisplayWidget extends StatefulWidget {
  const ExpressionDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpressionDisplayWidget> createState() =>
      _ExpressionDisplayWidgetState();
}

class _ExpressionDisplayWidgetState extends State<ExpressionDisplayWidget> {
  Widget _expressionWidget(BuildContext context) {
    DeviceService deviceService = DeviceService(context);

    double paddingX = deviceService.isPortrait
        ? 16.0
        : (deviceService.screenWidth / 11.0) / 3;
    double paddingY = deviceService.isPortrait ? 00.0 : 20.0;

    return Container(
      width: MediaQuery.of(context).size.width -
          (deviceService.isLandscape ? 60.0 : 0.0),
      height: 100.0,
      padding: EdgeInsets.only(
        left: paddingX,
        right: paddingX,
        top: paddingY,
      ),
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            calculatorStore.removeFirstCharacter();
          }

          if (details.primaryVelocity! < 0) {
            calculatorStore.removeLastCharacter();
          }
        },
        child: FittedBox(
          fit: BoxFit.contain,
          child: Observer(
            builder: (context) {
              String displayText = calculatorStore.expression.isNotEmpty
                  ? calculatorStore.expression
                  : '0';

              return Text(
                displayText,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 98.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _expressionWidget(context),
        ],
      ),
    );
  }
}
