// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculatorStore on _CalculatorStore, Store {
  Computed<String>? _$expressionComputed;

  @override
  String get expression =>
      (_$expressionComputed ??= Computed<String>(() => super.expression,
              name: '_CalculatorStore.expression'))
          .value;
  Computed<double>? _$xValueComputed;

  @override
  double get xValue => (_$xValueComputed ??=
          Computed<double>(() => super.xValue, name: '_CalculatorStore.xValue'))
      .value;
  Computed<double>? _$yValueComputed;

  @override
  double get yValue => (_$yValueComputed ??=
          Computed<double>(() => super.yValue, name: '_CalculatorStore.yValue'))
      .value;
  Computed<double>? _$memoryValueComputed;

  @override
  double get memoryValue =>
      (_$memoryValueComputed ??= Computed<double>(() => super.memoryValue,
              name: '_CalculatorStore.memoryValue'))
          .value;
  Computed<bool>? _$isMemoryEnabledComputed;

  @override
  bool get isMemoryEnabled =>
      (_$isMemoryEnabledComputed ??= Computed<bool>(() => super.isMemoryEnabled,
              name: '_CalculatorStore.isMemoryEnabled'))
          .value;
  Computed<bool>? _$isResetExpressionComputed;

  @override
  bool get isResetExpression => (_$isResetExpressionComputed ??= Computed<bool>(
          () => super.isResetExpression,
          name: '_CalculatorStore.isResetExpression'))
      .value;
  Computed<bool>? _$isPowerEnabledComputed;

  @override
  bool get isPowerEnabled =>
      (_$isPowerEnabledComputed ??= Computed<bool>(() => super.isPowerEnabled,
              name: '_CalculatorStore.isPowerEnabled'))
          .value;
  Computed<bool>? _$isExponentialEnabledComputed;

  @override
  bool get isExponentialEnabled => (_$isExponentialEnabledComputed ??=
          Computed<bool>(() => super.isExponentialEnabled,
              name: '_CalculatorStore.isExponentialEnabled'))
      .value;
  Computed<bool>? _$isTenToPowerXEnabledComputed;

  @override
  bool get isTenToPowerXEnabled => (_$isTenToPowerXEnabledComputed ??=
          Computed<bool>(() => super.isTenToPowerXEnabled,
              name: '_CalculatorStore.isTenToPowerXEnabled'))
      .value;
  Computed<bool>? _$isTwoToPowerXEnabledComputed;

  @override
  bool get isTwoToPowerXEnabled => (_$isTwoToPowerXEnabledComputed ??=
          Computed<bool>(() => super.isTwoToPowerXEnabled,
              name: '_CalculatorStore.isTwoToPowerXEnabled'))
      .value;
  Computed<bool>? _$isCustomRootEnabledComputed;

  @override
  bool get isCustomRootEnabled => (_$isCustomRootEnabledComputed ??=
          Computed<bool>(() => super.isCustomRootEnabled,
              name: '_CalculatorStore.isCustomRootEnabled'))
      .value;
  Computed<bool>? _$isSecondSchemeComputed;

  @override
  bool get isSecondScheme =>
      (_$isSecondSchemeComputed ??= Computed<bool>(() => super.isSecondScheme,
              name: '_CalculatorStore.isSecondScheme'))
          .value;
  Computed<bool>? _$isAngleModeEnabledComputed;

  @override
  bool get isAngleModeEnabled => (_$isAngleModeEnabledComputed ??=
          Computed<bool>(() => super.isAngleModeEnabled,
              name: '_CalculatorStore.isAngleModeEnabled'))
      .value;
  Computed<bool>? _$isLogSubscriptYEnabledComputed;

  @override
  bool get isLogSubscriptYEnabled => (_$isLogSubscriptYEnabledComputed ??=
          Computed<bool>(() => super.isLogSubscriptYEnabled,
              name: '_CalculatorStore.isLogSubscriptYEnabled'))
      .value;

  late final _$_expressionAtom =
      Atom(name: '_CalculatorStore._expression', context: context);

  @override
  String get _expression {
    _$_expressionAtom.reportRead();
    return super._expression;
  }

  @override
  set _expression(String value) {
    _$_expressionAtom.reportWrite(value, super._expression, () {
      super._expression = value;
    });
  }

  late final _$_xValueAtom =
      Atom(name: '_CalculatorStore._xValue', context: context);

  @override
  double get _xValue {
    _$_xValueAtom.reportRead();
    return super._xValue;
  }

  @override
  set _xValue(double value) {
    _$_xValueAtom.reportWrite(value, super._xValue, () {
      super._xValue = value;
    });
  }

  late final _$_yValueAtom =
      Atom(name: '_CalculatorStore._yValue', context: context);

  @override
  double get _yValue {
    _$_yValueAtom.reportRead();
    return super._yValue;
  }

  @override
  set _yValue(double value) {
    _$_yValueAtom.reportWrite(value, super._yValue, () {
      super._yValue = value;
    });
  }

  late final _$_memoryValueAtom =
      Atom(name: '_CalculatorStore._memoryValue', context: context);

  @override
  double get _memoryValue {
    _$_memoryValueAtom.reportRead();
    return super._memoryValue;
  }

  @override
  set _memoryValue(double value) {
    _$_memoryValueAtom.reportWrite(value, super._memoryValue, () {
      super._memoryValue = value;
    });
  }

  late final _$_isSecondSchemeAtom =
      Atom(name: '_CalculatorStore._isSecondScheme', context: context);

  @override
  bool get _isSecondScheme {
    _$_isSecondSchemeAtom.reportRead();
    return super._isSecondScheme;
  }

  @override
  set _isSecondScheme(bool value) {
    _$_isSecondSchemeAtom.reportWrite(value, super._isSecondScheme, () {
      super._isSecondScheme = value;
    });
  }

  late final _$_isResetExpressionAtom =
      Atom(name: '_CalculatorStore._isResetExpression', context: context);

  @override
  bool get _isResetExpression {
    _$_isResetExpressionAtom.reportRead();
    return super._isResetExpression;
  }

  @override
  set _isResetExpression(bool value) {
    _$_isResetExpressionAtom.reportWrite(value, super._isResetExpression, () {
      super._isResetExpression = value;
    });
  }

  late final _$_isMemoryEnabledAtom =
      Atom(name: '_CalculatorStore._isMemoryEnabled', context: context);

  @override
  bool get _isMemoryEnabled {
    _$_isMemoryEnabledAtom.reportRead();
    return super._isMemoryEnabled;
  }

  @override
  set _isMemoryEnabled(bool value) {
    _$_isMemoryEnabledAtom.reportWrite(value, super._isMemoryEnabled, () {
      super._isMemoryEnabled = value;
    });
  }

  late final _$_isPowerEnabledAtom =
      Atom(name: '_CalculatorStore._isPowerEnabled', context: context);

  @override
  bool get _isPowerEnabled {
    _$_isPowerEnabledAtom.reportRead();
    return super._isPowerEnabled;
  }

  @override
  set _isPowerEnabled(bool value) {
    _$_isPowerEnabledAtom.reportWrite(value, super._isPowerEnabled, () {
      super._isPowerEnabled = value;
    });
  }

  late final _$_isExponentialEnabledAtom =
      Atom(name: '_CalculatorStore._isExponentialEnabled', context: context);

  @override
  bool get _isExponentialEnabled {
    _$_isExponentialEnabledAtom.reportRead();
    return super._isExponentialEnabled;
  }

  @override
  set _isExponentialEnabled(bool value) {
    _$_isExponentialEnabledAtom.reportWrite(value, super._isExponentialEnabled,
        () {
      super._isExponentialEnabled = value;
    });
  }

  late final _$_isTenToPowerXEnabledAtom =
      Atom(name: '_CalculatorStore._isTenToPowerXEnabled', context: context);

  @override
  bool get _isTenToPowerXEnabled {
    _$_isTenToPowerXEnabledAtom.reportRead();
    return super._isTenToPowerXEnabled;
  }

  @override
  set _isTenToPowerXEnabled(bool value) {
    _$_isTenToPowerXEnabledAtom.reportWrite(value, super._isTenToPowerXEnabled,
        () {
      super._isTenToPowerXEnabled = value;
    });
  }

  late final _$_isTwoToPowerXEnabledAtom =
      Atom(name: '_CalculatorStore._isTwoToPowerXEnabled', context: context);

  @override
  bool get _isTwoToPowerXEnabled {
    _$_isTwoToPowerXEnabledAtom.reportRead();
    return super._isTwoToPowerXEnabled;
  }

  @override
  set _isTwoToPowerXEnabled(bool value) {
    _$_isTwoToPowerXEnabledAtom.reportWrite(value, super._isTwoToPowerXEnabled,
        () {
      super._isTwoToPowerXEnabled = value;
    });
  }

  late final _$_isCustomRootEnabledAtom =
      Atom(name: '_CalculatorStore._isCustomRootEnabled', context: context);

  @override
  bool get _isCustomRootEnabled {
    _$_isCustomRootEnabledAtom.reportRead();
    return super._isCustomRootEnabled;
  }

  @override
  set _isCustomRootEnabled(bool value) {
    _$_isCustomRootEnabledAtom.reportWrite(value, super._isCustomRootEnabled,
        () {
      super._isCustomRootEnabled = value;
    });
  }

  late final _$_isAngleModeEnabledAtom =
      Atom(name: '_CalculatorStore._isAngleModeEnabled', context: context);

  @override
  bool get _isAngleModeEnabled {
    _$_isAngleModeEnabledAtom.reportRead();
    return super._isAngleModeEnabled;
  }

  @override
  set _isAngleModeEnabled(bool value) {
    _$_isAngleModeEnabledAtom.reportWrite(value, super._isAngleModeEnabled, () {
      super._isAngleModeEnabled = value;
    });
  }

  late final _$_isLogSubscriptYEnabledAtom =
      Atom(name: '_CalculatorStore._isLogSubscriptYEnabled', context: context);

  @override
  bool get _isLogSubscriptYEnabled {
    _$_isLogSubscriptYEnabledAtom.reportRead();
    return super._isLogSubscriptYEnabled;
  }

  @override
  set _isLogSubscriptYEnabled(bool value) {
    _$_isLogSubscriptYEnabledAtom
        .reportWrite(value, super._isLogSubscriptYEnabled, () {
      super._isLogSubscriptYEnabled = value;
    });
  }

  late final _$_CalculatorStoreActionController =
      ActionController(name: '_CalculatorStore', context: context);

  @override
  void setExpression(String expression) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setExpression');
    try {
      return super.setExpression(expression);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFirstCharacter() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.removeFirstCharacter');
    try {
      return super.removeFirstCharacter();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeLastCharacter() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.removeLastCharacter');
    try {
      return super.removeLastCharacter();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpressionError() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setExpressionError');
    try {
      return super.setExpressionError();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearExpression() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.clearExpression');
    try {
      return super.clearExpression();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetExpression() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.resetExpression');
    try {
      return super.resetExpression();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.reset');
    try {
      return super.reset();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setXValue(double value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setXValue');
    try {
      return super.setXValue(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYValue(double value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setYValue');
    try {
      return super.setYValue(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMemoryValue(double value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setMemoryValue');
    try {
      return super.setMemoryValue(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetMemoryValue() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.resetMemoryValue');
    try {
      return super.resetMemoryValue();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSecondScheme(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setSecondScheme');
    try {
      return super.setSecondScheme(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResetExpression(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setResetExpression');
    try {
      return super.setResetExpression(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPower(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setPower');
    try {
      return super.setPower(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExponential(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setExponential');
    try {
      return super.setExponential(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTenToPowerX(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setTenToPowerX');
    try {
      return super.setTenToPowerX(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTwoToPowerX(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setTwoToPowerX');
    try {
      return super.setTwoToPowerX(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomRoot(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setCustomRoot');
    try {
      return super.setCustomRoot(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMemory(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setMemory');
    try {
      return super.setMemory(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAngleMode(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setAngleMode');
    try {
      return super.setAngleMode(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogSubscriptY(bool value) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.setLogSubscriptY');
    try {
      return super.setLogSubscriptY(value);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSecondScheme() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleSecondScheme');
    try {
      return super.toggleSecondScheme();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleResetExpression() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleResetExpression');
    try {
      return super.toggleResetExpression();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePower() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.togglePower');
    try {
      return super.togglePower();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExponential() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleExponential');
    try {
      return super.toggleExponential();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTenToPowerX() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleTenToPowerX');
    try {
      return super.toggleTenToPowerX();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTwoToPowerX() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleTwoToPowerX');
    try {
      return super.toggleTwoToPowerX();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCustomRoot() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleCustomRoot');
    try {
      return super.toggleCustomRoot();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMemory() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleMemory');
    try {
      return super.toggleMemory();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleAngleMode() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleAngleMode');
    try {
      return super.toggleAngleMode();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLogSubscriptY() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.toggleLogSubscriptY');
    try {
      return super.toggleLogSubscriptY();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void backspace() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.backspace');
    try {
      return super.backspace();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSign() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.changeSign');
    try {
      return super.changeSign();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void evaluate() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.evaluate');
    try {
      return super.evaluate();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void evaluateExpression() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.evaluateExpression');
    try {
      return super.evaluateExpression();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void applyPercentage() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.applyPercentage');
    try {
      return super.applyPercentage();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void appendOperator(String operator) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.appendOperator');
    try {
      return super.appendOperator(operator);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDecimalPoint() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.addDecimalPoint');
    try {
      return super.addDecimalPoint();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMemory() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.clearMemory');
    try {
      return super.clearMemory();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToMemory() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.addToMemory');
    try {
      return super.addToMemory();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subtractFromMemory() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.subtractFromMemory');
    try {
      return super.subtractFromMemory();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void recallMemory() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.recallMemory');
    try {
      return super.recallMemory();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeScheme() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.changeScheme');
    try {
      return super.changeScheme();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void square() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.square');
    try {
      return super.square();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cube() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.cube');
    try {
      return super.cube();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void power() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.power');
    try {
      return super.power();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void exponentialPower() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.exponentialPower');
    try {
      return super.exponentialPower();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tenToPowerX() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.tenToPowerX');
    try {
      return super.tenToPowerX();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void twoToPowerX() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.twoToPowerX');
    try {
      return super.twoToPowerX();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reciprocal() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.reciprocal');
    try {
      return super.reciprocal();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void squareRootSquare() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.squareRootSquare');
    try {
      return super.squareRootSquare();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cubeRootSquare() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.cubeRootSquare');
    try {
      return super.cubeRootSquare();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void customRoot() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.customRoot');
    try {
      return super.customRoot();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ln() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.ln');
    try {
      return super.ln();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logSubscript2() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.logSubscript2');
    try {
      return super.logSubscript2();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logSubscript10() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.logSubscript10');
    try {
      return super.logSubscript10();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logSubscriptY() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.logSubscriptY');
    try {
      return super.logSubscriptY();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void factorial() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.factorial');
    try {
      return super.factorial();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sine() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.sine');
    try {
      return super.sine();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cosine() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.cosine');
    try {
      return super.cosine();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tangent() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.tangent');
    try {
      return super.tangent();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void exponential() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.exponential');
    try {
      return super.exponential();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ee() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.ee');
    try {
      return super.ee();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sineh() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.sineh');
    try {
      return super.sineh();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cosineh() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.cosineh');
    try {
      return super.cosineh();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tangenth() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.tangenth');
    try {
      return super.tangenth();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pi() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.pi');
    try {
      return super.pi();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rand() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.rand');
    try {
      return super.rand();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void appendText(String newText) {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.appendText');
    try {
      return super.appendText(newText);
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculatePower() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.calculatePower');
    try {
      return super.calculatePower();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateExponential() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.calculateExponential');
    try {
      return super.calculateExponential();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTenToPowerX() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.calculateTenToPowerX');
    try {
      return super.calculateTenToPowerX();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateTwoToPowerX() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.calculateTwoToPowerX');
    try {
      return super.calculateTwoToPowerX();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateCustomRoot() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.calculateCustomRoot');
    try {
      return super.calculateCustomRoot();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateLogSubscriptY() {
    final _$actionInfo = _$_CalculatorStoreActionController.startAction(
        name: '_CalculatorStore.calculateLogSubscriptY');
    try {
      return super.calculateLogSubscriptY();
    } finally {
      _$_CalculatorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expression: ${expression},
xValue: ${xValue},
yValue: ${yValue},
memoryValue: ${memoryValue},
isMemoryEnabled: ${isMemoryEnabled},
isResetExpression: ${isResetExpression},
isPowerEnabled: ${isPowerEnabled},
isExponentialEnabled: ${isExponentialEnabled},
isTenToPowerXEnabled: ${isTenToPowerXEnabled},
isTwoToPowerXEnabled: ${isTwoToPowerXEnabled},
isCustomRootEnabled: ${isCustomRootEnabled},
isSecondScheme: ${isSecondScheme},
isAngleModeEnabled: ${isAngleModeEnabled},
isLogSubscriptYEnabled: ${isLogSubscriptYEnabled}
    ''';
  }
}
