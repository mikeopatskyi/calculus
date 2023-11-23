import 'dart:io';

import 'package:flutter/material.dart';

class DeviceService {
  bool _isSmartphone = false;

  bool _isAndroid = false;

  bool _isIOS = false;

  bool _isPortrait = false;

  bool _isLandscape = false;

  double _screenWidth = 0.0;

  double _screenHeight = 0.0;

  bool get isSmartphone => _isSmartphone;

  bool get isAndroid => _isAndroid;

  bool get isIOS => _isIOS;

  bool get isPortrait => _isPortrait;

  bool get isLandscape => _isLandscape;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  bool get _isAndroidPlatform => Platform.isAndroid;

  bool get _isIOSPlatform => Platform.isIOS;

  void _initializeDeviceProperties(BuildContext context) {
    _isSmartphone = true;

    if (_isAndroidPlatform) {
      _isAndroid = true;
    }

    if (_isIOSPlatform) {
      _isIOS = true;
    }

    if (_isPortraitOrientation(context)) {
      _isPortrait = true;
    }

    if (_isLandscapeOrientation(context)) {
      _isLandscape = true;
    }

    _screenWidth = _getScreenWidth(context);
    _screenHeight = _getScreenHeight(context);

    checkSmartphone(context);
  }

  bool _isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  bool _isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  double _getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double _getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  Future<void> checkSmartphone(BuildContext context) async {
    var platform = Theme.of(context).platform;

    _isSmartphone = true;

    if (platform == TargetPlatform.android) {
      double threshold = 600.0;
      _isSmartphone = _getScreenWidth(context) < threshold ||
          _getScreenHeight(context) < threshold;
    } else if (platform == TargetPlatform.iOS) {
      double threshold = 600.0;

      _isSmartphone = _getScreenWidth(context) < threshold ||
          _getScreenHeight(context) < threshold;
    } else {
      _isSmartphone = false;
    }
  }

  DeviceService(BuildContext context) {
    _initializeDeviceProperties(context);
  }
}
