import 'package:bmi_plus_1/color1/color.dart';
import 'detils_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Gender(ismale: true),
          Gender(ismale: false),
        ],
      ),
    );
  }
}

class Gender extends StatelessWidget {
  Gender({
    super.key,
    required this.ismale,
  });
  bool ismale;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BmiApp(ismale: ismale),
            ),
          );
        },
        child: Container(
          color: ismale ? blue : red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ismale?"Male": "Female",
                style: TextStyle(
                  color: white,
                  fontSize: MediaQuery.of(context).size.width * 0.14,
                ),
              ),
              Icon(
                ismale?Icons.male:Icons.female,
                color: white,
                size: MediaQuery.of(context).size.width * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
