class ExpressionModel {
  String _expression = '0';
  double _xValue = 0.0;
  double _yValue = 0.0;
  double _memoryValue = 0.0;

  bool _isSecondScheme = false;
  bool _isResetExpression = false;
  bool _isMemoryEnabled = false;
  bool _isPowerEnabled = false;
  bool _isExponentialEnabled = false;
  bool _isTenToPowerXEnabled = false;
  bool _isTwoToPowerXEnabled = false;
  bool _isCustomRootEnabled = false;
  bool _isAngleModeEnabled = false;
  bool _isLogSubscriptYEnabled = false;

  String get expression => _expression;

  double get xValue => _xValue;

  double get yValue => _yValue;

  double get memoryValue => _memoryValue;

  bool get isMemoryEnabled => _isMemoryEnabled;

  bool get isResetExpression => _isResetExpression;

  bool get isPowerEnabled => _isPowerEnabled;

  bool get isExponentialEnabled => _isExponentialEnabled;

  bool get isTenToPowerXEnabled => _isTenToPowerXEnabled;

  bool get isTwoToPowerXEnabled => _isTwoToPowerXEnabled;

  bool get isCustomRootEnabled => _isCustomRootEnabled;

  bool get isSecondScheme => _isSecondScheme;

  bool get isAngleModeEnabled => _isAngleModeEnabled;

  bool get isLogSubscriptYEnabled => _isLogSubscriptYEnabled;

  void setExpression(String expression) {
    _expression = expression;
  }

  void removeFirstCharacter() {
    _expression = _expression.length > 1 ? _expression.substring(1) : '0';
  }

  void removeLastCharacter() {
    _expression = _expression.length > 1
        ? _expression.substring(0, _expression.length - 1)
        : '0';
  }

  void setExpressionError() {
    _expression = 'Error';
  }

  void clearExpression() {
    _expression = '';
  }

  void resetExpression() {
    _expression = '0';
  }

  void setXValue(double xValue) {
    _xValue = xValue;
  }

  void setYValue(double yValue) {
    _yValue = yValue;
  }

  void setMemoryValue(double memoryValue) {
    _memoryValue = memoryValue;
  }

  void resetMemoryValue() {
    _memoryValue = 0.0;
  }

  void setSecondScheme(bool value) {
    _isSecondScheme = value;
  }

  void setResetExpression(bool value) {
    _isResetExpression = value;
  }

  void setPower(bool value) {
    _isPowerEnabled = value;
  }

  void setExponential(bool value) {
    _isExponentialEnabled = value;
  }

  void setTenToPowerX(bool value) {
    _isTenToPowerXEnabled = value;
  }

  void setTwoToPowerX(bool value) {
    _isTwoToPowerXEnabled = value;
  }

  void setCustomRoot(bool value) {
    _isCustomRootEnabled = value;
  }

  void setMemory(bool value) {
    _isMemoryEnabled = value;
  }

  void setAngleMode(bool value) {
    _isAngleModeEnabled = value;
  }

  void setLogSubscriptY(bool value) {
    _isLogSubscriptYEnabled = value;
  }

  void toggleSecondScheme() {
    _isSecondScheme = !_isSecondScheme;
  }

  void toggleResetExpression() {
    _isResetExpression = !_isResetExpression;
  }

  void togglePower() {
    _isPowerEnabled = !_isPowerEnabled;
  }

  void toggleExponential() {
    _isExponentialEnabled = !_isExponentialEnabled;
  }

  void toggleTenToPowerX() {
    _isTenToPowerXEnabled = !_isTenToPowerXEnabled;
  }

  void toggleTwoToPowerX() {
    _isTwoToPowerXEnabled = !_isTwoToPowerXEnabled;
  }

  void toggleCustomRoot() {
    _isCustomRootEnabled = !_isCustomRootEnabled;
  }

  void toggleMemory() {
    _isMemoryEnabled = !_isMemoryEnabled;
  }

  void toggleAngleMode() {
    _isAngleModeEnabled = !_isAngleModeEnabled;
  }

  void toggleLogSubscriptY() {
    _isLogSubscriptYEnabled = !_isLogSubscriptYEnabled;
  }
}
