// import 'package:mobx/mobx.dart';

// part 'calculator_store.g.dart';

// // class CalculatorStore = _CalculatorStore with _$CalculatorStore;

// class CalculatorStore extends _CalculatorStore with _$CalculatorStore {
//   CalculatorStore._();
//   factory CalculatorStore.getInstance() => _instance;
//   static final CalculatorStore _instance = CalculatorStore._();
// }

// abstract class _CalculatorStore with Store {
//   @observable
//   String _expression = '0';

//   @observable
//   double _xValue = 0.0;

//   @observable
//   double _yValue = 0.0;

//   @observable
//   double _memoryValue = 0.0;

//   @observable
//   bool _isSecondScheme = false;

//   @observable
//   bool _isResetExpression = false;

//   @observable
//   bool _isMemoryEnabled = false;

//   @observable
//   bool _isPowerEnabled = false;

//   @observable
//   bool _isExponentialEnabled = false;

//   @observable
//   bool _isTenToPowerXEnabled = false;

//   @observable
//   bool _isTwoToPowerXEnabled = false;

//   @observable
//   bool _isCustomRootEnabled = false;

//   @observable
//   bool _isAngleModeEnabled = false;

//   @observable
//   bool _isLogSubscriptYEnabled = false;

//   @computed
//   String get expression => _expression;

//   @computed
//   double get xValue => _xValue;

//   @computed
//   double get yValue => _yValue;

//   @computed
//   double get memoryValue => _memoryValue;

//   @computed
//   bool get isMemoryEnabled => _isMemoryEnabled;

//   @computed
//   bool get isResetExpression => _isResetExpression;

//   @computed
//   bool get isPowerEnabled => _isPowerEnabled;

//   @computed
//   bool get isExponentialEnabled => _isExponentialEnabled;

//   @computed
//   bool get isTenToPowerXEnabled => _isTenToPowerXEnabled;

//   @computed
//   bool get isTwoToPowerXEnabled => _isTwoToPowerXEnabled;

//   @computed
//   bool get isCustomRootEnabled => _isCustomRootEnabled;

//   @computed
//   bool get isSecondScheme => _isSecondScheme;

//   @computed
//   bool get isAngleModeEnabled => _isAngleModeEnabled;

//   @computed
//   bool get isLogSubscriptYEnabled => _isLogSubscriptYEnabled;

//   @action
//   void setExpression(String expression) {
//     _expression = expression;
//   }

//   @action
//   void removeFirstCharacter() {
//     _expression = _expression.length > 1 ? _expression.substring(1) : '0';
//   }

//   @action
//   void removeLastCharacter() {
//     _expression = _expression.length > 1
//         ? _expression.substring(0, _expression.length - 1)
//         : '0';
//   }

//   @action
//   void setExpressionError() {
//     _expression = 'Error';
//   }

//   @action
//   void clearExpression() {
//     _expression = '';
//   }

//   @action
//   void resetExpression() {
//     _expression = '0';
//   }

//   @action
//   void setXValue(double xValue) {
//     _xValue = xValue;
//   }

//   @action
//   void setYValue(double yValue) {
//     _yValue = yValue;
//   }

//   @action
//   void setMemoryValue(double memoryValue) {
//     _memoryValue = memoryValue;
//   }

//   @action
//   void resetMemoryValue() {
//     _memoryValue = 0.0;
//   }

//   @action
//   void setSecondScheme(bool value) {
//     _isSecondScheme = value;
//   }

//   @action
//   void setResetExpression(bool value) {
//     _isResetExpression = value;
//   }

//   @action
//   void setPower(bool value) {
//     _isPowerEnabled = value;
//   }

//   @action
//   void setExponential(bool value) {
//     _isExponentialEnabled = value;
//   }

//   @action
//   void setTenToPowerX(bool value) {
//     _isTenToPowerXEnabled = value;
//   }

//   @action
//   void setTwoToPowerX(bool value) {
//     _isTwoToPowerXEnabled = value;
//   }

//   @action
//   void setCustomRoot(bool value) {
//     _isCustomRootEnabled = value;
//   }

//   @action
//   void setMemory(bool value) {
//     _isMemoryEnabled = value;
//   }

//   @action
//   void setAngleMode(bool value) {
//     _isAngleModeEnabled = value;
//   }

//   @action
//   void setLogSubscriptY(bool value) {
//     _isLogSubscriptYEnabled = value;
//   }

//   @action
//   void toggleSecondScheme() {
//     _isSecondScheme = !_isSecondScheme;
//   }

//   @action
//   void toggleResetExpression() {
//     _isResetExpression = !_isResetExpression;
//   }

//   @action
//   void togglePower() {
//     _isPowerEnabled = !_isPowerEnabled;
//   }

//   @action
//   void toggleExponential() {
//     _isExponentialEnabled = !_isExponentialEnabled;
//   }

//   @action
//   void toggleTenToPowerX() {
//     _isTenToPowerXEnabled = !_isTenToPowerXEnabled;
//   }

//   @action
//   void toggleTwoToPowerX() {
//     _isTwoToPowerXEnabled = !_isTwoToPowerXEnabled;
//   }

//   @action
//   void toggleCustomRoot() {
//     _isCustomRootEnabled = !_isCustomRootEnabled;
//   }

//   @action
//   void toggleMemory() {
//     _isMemoryEnabled = !_isMemoryEnabled;
//   }

//   @action
//   void toggleAngleMode() {
//     _isAngleModeEnabled = !_isAngleModeEnabled;
//   }

//   @action
//   void toggleLogSubscriptY() {
//     _isLogSubscriptYEnabled = !_isLogSubscriptYEnabled;
//   }

//   //
//   @action
//   void appendText(String newText) {
//     _expression = (_expression == '0') ? newText : expression + newText;
//   }
// }
