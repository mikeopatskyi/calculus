import 'package:calculus/services/device_service.dart';
import 'package:flutter/material.dart';

class BottomSpacerWidget extends StatelessWidget {
  const BottomSpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceService deviceService = DeviceService(context);

    return SizedBox(
      width: double.infinity,
      height: deviceService.isIOS
          ? 30.0
          : deviceService.isSmartphone
              ? 0.0
              : 20.0,
    );
  }
}
