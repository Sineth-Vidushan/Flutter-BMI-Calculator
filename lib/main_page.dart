import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:testprojects/constants.dart';
import 'dart:ui';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 67;

  String gender = '';

  late double bmi = calculeteBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World App'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                        color: gender == 'M'
                            ? Colors.purple.withAlpha(150)
                            : Colors.purple.withAlpha(50),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.male_rounded,
                            size: 150,
                          ),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Female");
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                        color: gender == 'F'
                            ? Colors.purple.withAlpha(150)
                            : Colors.purple.withAlpha(50),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female_rounded,
                              size: 150,
                            ),
                            Text("Female"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Height"),
                        Text("$height",
                            style: TextStyle(
                              color: ktextColor,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            )),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height >= 50) height--;
                                  bmi = calculeteBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height <= 250) height++;
                                  bmi = calculeteBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Weight"),
                        Text(
                          "$weight",
                          style: TextStyle(
                            color: ktextColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight >= 10) weight--;
                                  bmi = calculeteBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight <= 250) weight++;
                                  bmi = calculeteBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: ktextColor,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${getResult(bmi)}",
                    style: TextStyle(
                      color: ktextColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculeteBMI({required int height, required int weight}) {
    return weight / ((height / 100) * (height / 100));
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
