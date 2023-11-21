import 'package:calculus/models/expression_model.dart';
import 'package:calculus/services/device_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpressionDisplayWidget extends StatelessWidget {
  final ExpressionModel _expressionModel = ExpressionModel();

  ExpressionDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceService deviceService = DeviceService(context);

    double paddingX = deviceService.isPortrait
        ? 16.0
        : (deviceService.screenWidth / 11.0) / 3;
    double paddingY = deviceService.isPortrait ? 00.0 : 20.0;

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
              _expressionModel.removeLastCharacter();
            }

            if (details.primaryVelocity! < 0) {
              _expressionModel.removeFirstCharacter();
            }
          },
          // child: Text(
          //   _expressionModel.expression,
          //   style: GoogleFonts.roboto(
          //     textStyle: const TextStyle(
          //       fontSize: 98.0,
          //       fontWeight: FontWeight.w300,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          child: FittedBox(
            child: Text(
              _expressionModel.expression,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 98.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
