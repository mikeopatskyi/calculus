import 'package:calculus/widgets/ad_popup_widget.dart';
import 'package:calculus/widgets/bottom_spacer_widget.dart';
import 'package:calculus/widgets/button_rows_widget.dart';
import 'package:calculus/widgets/expression_display_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          ExpressionDisplayWidget(),
          ButtonsRowsWidget(),
          const BottomSpacerWidget(),
          const AdPopup(),
        ],
      ),
    );
  }
}
