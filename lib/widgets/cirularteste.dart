
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todov2/stores/counterprogress.dart';

class MyWidget extends StatefulWidget {
  
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  
  CounterProgress counter = CounterProgress();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        child: Observer(
            builder: (_) => CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 7.0,
                  animation: true,
                  percent: counter.testando.length / 10,
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
                )))
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counter.addtestando(100);
      }),
    );
  }
}