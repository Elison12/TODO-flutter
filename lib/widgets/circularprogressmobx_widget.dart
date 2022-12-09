import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todov2/models/task.dart';
import 'package:todov2/stores/counterprogress.dart';

class CircularProgressMobxWidget extends StatelessWidget {
  CounterProgress counter = CounterProgress();

  CircularProgressMobxWidget(
      {Key? key, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Observer(
            builder: (_) => CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 7.0,
                  animation: true,
                  percent: counter.tasks.length / 100,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFF939fdb),
                  center: Container(
                      height: 42,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/img/freddie3.jpg')))),
                  // footer: Text("Sales this week", style: TextStyle(fontSize: 14),),
                )));
  }
}
