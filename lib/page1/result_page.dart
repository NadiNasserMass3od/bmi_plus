import 'dart:math';

import 'package:bmi_plus_1/color1/color.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
    required this.weight,
    required this.height,
    required this.ismale,
  });
  double height, weight;
  bool ismale;
  String string = " ";

  @override
  Widget build(BuildContext context) {
    double result = weight / pow(height / 100, 2);
    switch (result) {
      case <= 16:
        string = "Sever thinness";
        break;
      case > 16 && <= 18.5:
        string = "Thinness";
        break;
      case > 18.5 && <= 25:
        string = "Normal";
        break;
      case > 25 && <= 30:
        string = "Over Weight";
        break;
      case > 30:
        string = "Obese";
        break;
      default:
    }
    return Scaffold(
      body: Container(
        color: ismale ? blue : red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The result is",
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Text(
                  result.toStringAsFixed(2),
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                Text(
                  string,
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: white,
                    size: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
