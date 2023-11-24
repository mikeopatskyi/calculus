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
  String toString() {
    return '''
expression: ${expression}
    ''';
  }
}
