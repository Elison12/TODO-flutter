import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todov2/bloc/circularProgress/circularProgress_bloc.dart';


class Circularprogresswidget extends StatelessWidget {
  const Circularprogresswidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 50),
      child: BlocConsumer<CircularProgressBloc, CircularProgressState>(
          listener: (context, state) {
        if (state is IncrementState) {
          print("aumento");
        } else if (state is DecrementState) {
          print("diminuiu");
        }
      }, builder: (context, state) {
        return CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 7.0,
          animation: true,
          percent: state.progress,
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
        );
      }),
    );
  }
}