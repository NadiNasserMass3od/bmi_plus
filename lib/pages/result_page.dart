import 'dart:math';

import 'package:bmi_plus_1/color1/color.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
    required this.height,
    required this.weight,
    required this.isMale,
  });
  bool isMale;
  double height, weight;
  @override
  Widget build(BuildContext context) {
    double result = weight / pow(height / 100, 2);
    /* 
    Underweight: BMI less than 18.5
    Normal weight: BMI of 18.5 to 24.9
    Overweight: BMI of 25 to 29.9
    Obesity: BMI of 30 or higher
     */
    String res = " ";
    switch (result) {
      case < 18.5:
        res = "Underweight";
        break;
      case >= 18.5 && < 24.9:
        res = "Normal";
        break;
      case > 25 && < 29.9:
        res = "Overweight";
        break;
      case > 30:
        res = "Obesity";
        break;
    }

    return Scaffold(
      body: Container(
        color: isMale ? blue : red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The BMI result is",
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Text(
                  result.toStringAsFixed(2),
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                Text(
                  res,
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: white,
                    size: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
