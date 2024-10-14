import 'package:bmi_plus_1/colors/colors.dart';
import 'package:bmi_plus_1/pages/result_page.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  ControlPage({
    super.key,
    required this.isMale,
  });
  bool isMale;
  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double height = 5, weight = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                          Text(
                            "BMI",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.09,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            widget.isMale ? "Male" : "Female",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.15,
                              color: widget.isMale ? blue : red,
                            ),
                          ),
                          Icon(
                            widget.isMale ? Icons.male : Icons.female,
                            size: MediaQuery.of(context).size.width * 0.2,
                            color: widget.isMale ? blue : red,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                              color: widget.isMale ? blue : red,
                            ),
                          ),
                          Text(
                            "(kg)",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                              color: widget.isMale ? blue : red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 176,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                index = index + 25;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight = index.toDouble();
                                    });
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$index",
                                        style: TextStyle(
                                          color: index == weight
                                              ? widget.isMale
                                                  ? blue
                                                  : red
                                              : black,
                                          fontSize: weight == index
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: widget.isMale ? blue : red,
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                  color: white),
                            ),
                            Text(
                              "(cm)",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.08,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Row(
                          children: [
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListView.builder(
                                itemCount: 176,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  index = index + 25;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        height = index.toDouble();
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: index == height
                                            ? white
                                            : widget.isMale
                                                ? blue
                                                : red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$index",
                                          style: TextStyle(
                                            color: index == height
                                                ? !widget.isMale
                                                    ? blue
                                                    : red
                                                : white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width * (1 / 3 + 1 / 6),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      height: height,
                      weight: weight,
                      isMale: widget.isMale,
                    ),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: !widget.isMale ? blue : red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Calc",
                    style: TextStyle(
                      color: white,
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
