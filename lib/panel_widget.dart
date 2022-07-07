import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:pocketify/app_color.dart';

class Calculalor {
  static String userInput = "";
  static List<String> other = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "."
  ];
  static List<String> operators = ["+", "-", "/", "x"];

  static bool isOperator(String s) {
    return operators.contains(s);
  }

  static String calculate(String s) {
    String finaluserinput = s.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }
}

class PanelWidget extends StatelessWidget {
  final double screenWidth;
  final double maxHeight;
  final ScrollController controller;
  final VoidCallback callback;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.screenWidth,
    required this.maxHeight,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: AppColor.fabDark,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        buildCalculator()
      ],
    );
  }

  Widget buildCalculator() {
    List<String> list = [
      "7",
      "8",
      "9",
      "/",
      "4",
      "5",
      "6",
      "x",
      "1",
      "2",
      "3",
      "-",
      "0",
      ".",
      "<",
      "+"
    ];
    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int j = 0; j < 4; j++)
                item(
                  value: list[4 * i + j],
                )
            ],
          ),
      ],
    );
  }

  Widget item({required String value}) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Calculalor.userInput = value;
          callback();
        },
        child: Container(
          width: ((screenWidth / 4) - 25),
          height: ((maxHeight / 4) - 25),
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Material(
            elevation: 4.0,
            color: Calculalor.isOperator(value) || value == "<"
                ? AppColor.fabLight
                : Colors.white,
            borderRadius: BorderRadius.circular(5),
            child: Center(
              child: value == "<"
                  ? const Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 30,
                    )
                  : Text(
                      value,
                      style: TextStyle(
                        color: Calculalor.isOperator(value)
                            ? Colors.white
                            : Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
