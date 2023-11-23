import 'package:calculus/store/calculator_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

final calculatorStore = CalculatorStore.getInstance();

class LatexWidget extends StatefulWidget {
  const LatexWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LatexWidget> createState() => _LatexWidgetState();
}

class _LatexWidgetState extends State<LatexWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Math.tex(
          r'x^2 + y^2 = z^2',
          textStyle: const TextStyle(fontSize: 42, color: Colors.white),
          // logicalPpi: MathOptions.defaultLogicalPpiFor(42),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
