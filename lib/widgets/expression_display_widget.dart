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
  @override
  Widget build(BuildContext context) {
    DeviceService deviceService = DeviceService(context);

    double paddingX = deviceService.isPortrait
        ? 16.0
        : (deviceService.screenWidth / 11.0) / 3;
    double paddingY = deviceService.isPortrait ? 00.0 : 20.0;

    print(calculatorStore.expression);
    return Expanded(
      child: Container(
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
              calculatorStore.removeLastCharacter();
            }

            if (details.primaryVelocity! < 0) {
              calculatorStore.removeFirstCharacter();
            }
          },
          child: FittedBox(
            child: Observer(
              builder: (context) {
                print(
                    'Rebuilding ExpressionDisplayWidget:: ${calculatorStore.expression}');
                return Text(
                  calculatorStore.expression,
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
      ),
    );
  }
}
