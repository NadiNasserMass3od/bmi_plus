import 'package:bmi_plus_1/color1/color.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  BmiApp({
    super.key,
    required this.ismale,
  });
  bool ismale;

  @override
  State<BmiApp> createState() => _BmiApp();
}

class _BmiApp extends State<BmiApp> {
  double height = 25, weight = 25;
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
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: widget.ismale ? blue : red,
                              size: MediaQuery.of(context).size.width * 0.09,
                            ),
                          ),
                          Text(
                            "BMI",
                            style: TextStyle(
                              color: widget.ismale ? blue : red,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.ismale ? "Male" : "Female",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                          Icon(
                            widget.ismale ? Icons.male : Icons.female,
                            size: MediaQuery.of(context).size.width * 0.2,
                            color: widget.ismale ? blue : red,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                          Text(
                            "(kg)",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 126,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                index = index + 25;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      weight = index.toDouble();
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$index",
                                          style: TextStyle(
                                            fontSize: index == weight
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.07,
                                            color: (index == weight)
                                                ? widget.ismale
                                                    ? blue
                                                    : red
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.ismale ? blue : red,
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.1,
                                color: white,
                              ),
                            ),
                            Text(
                              "(cm)",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Row(
                          children: [
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                itemCount: 151,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  index = index + 24;
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        height = index.toDouble();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: !(index == height)
                                              ? widget.ismale
                                                  ? blue
                                                  : red
                                              : white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.09,
                                              color: !(index == height)
                                                  ? white
                                                  : Colors.black,
                                            ),
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
              )
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.width * (1 / 3 - 0.11),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      height: height,
                      weight: weight,
                      ismale: widget.ismale,
                    ),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.22,
                decoration: BoxDecoration(
                  color: widget.ismale ? red : blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Calc",
                    style: TextStyle(
                      color: white,
                      fontSize: MediaQuery.of(context).size.width * 0.054,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
