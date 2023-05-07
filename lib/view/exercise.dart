import 'package:promat/components/custom_appbar.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:flutter/material.dart';
import 'package:promat/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class Exercise extends StatefulWidget {
  const Exercise({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> with TickerProviderStateMixin {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Exercise",
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "                $counter cal",
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 249, 249, 249),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 141, 20, 20)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkResponse(
                      onTap: () {
                        setState(() {
                          counter += 200;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(children: [
                          const Text("Walking"),
                          Image.asset('assets/icons/Walking.png'),
                          const Text("200 cal")
                        ]),
                      ),
                    ),
                    InkResponse(
                      onTap: () {
                        setState(() {
                          counter += 400;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(children: [
                          const Text("Running"),
                          Image.asset('assets/icons/Running.png'),
                          const Text("400 cal")
                        ]),
                      ),
                    ),
                    InkResponse(
                      onTap: () {
                        setState(() {
                          counter += 160;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(children: [
                          const Text("Body Building"),
                          Image.asset('assets/icons/Workout.png'),
                          const Text("160 cal")
                        ]),
                      ),
                    ),
                    InkResponse(
                      onTap: () {
                        setState(() {
                          counter += 280;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(children: [
                          const Text("Powerlifting"),
                          Image.asset('assets/icons/Workoutt.png'),
                          const Text("280 cal")
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
