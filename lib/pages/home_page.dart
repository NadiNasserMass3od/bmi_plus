import 'package:bmi_plus_1/color1/color.dart';
import 'package:bmi_plus_1/pages/control_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Gender(isMale: true),
          Gender(isMale: false),
        ],
      ),
    );
  }
}

class Gender extends StatelessWidget {
  Gender({
    super.key,
    required this.isMale,
  });
  bool isMale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ControlPage(
                isMale: isMale,
              ),
            ),
          );
        },
        child: Container(
          color: isMale ? blue : red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isMale ? Icons.male : Icons.female,
                color: white,
                size: MediaQuery.of(context).size.width * 0.25,
              ),
              Text(
                isMale ? "Male" : "Female",
                style: TextStyle(
                  color: white,
                  fontSize: MediaQuery.of(context).size.width * 0.14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
