import 'package:calculus/store/calculator_store.dart';
import 'package:calculus/widgets/bottom_spacer_widget.dart';
import 'package:calculus/widgets/button_rows_widget.dart';
import 'package:calculus/widgets/expression_display_widget.dart';
import 'package:flutter/material.dart';

final calculatorStore = CalculatorStore.getInstance();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuilding HomeScreen:: ${calculatorStore.expression}');

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          const ExpressionDisplayWidget(),
          ButtonsRowsWidget(),
          const BottomSpacerWidget(),
          // const AdPopup(),
        ],
      ),
    );
  }
}
