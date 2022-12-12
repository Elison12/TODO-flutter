import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todov2/bloc/circularProgress/circularProgress_bloc.dart';
import 'package:todov2/bloc/crud_bloc.dart';

import '../models/task.dart';


class CircularCrud extends StatelessWidget {

  const CircularCrud({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CrudBloc, CrudState>(
      builder: (context, state) {
        if (state is DisplayTodos) {
          return CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 7.0,
            animation: true,
            percent: state.task.length/10,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: const Color(0xFF939fdb),
            center: Container(
              height: 42,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/freddie3.jpg')))),
          // footer: Text("Sales this week", style: TextStyle(fontSize: 14),)
          );
          
        }
        return Container(
          color: const Color(0xFF939fdb),
          child: const Center(child: CircularProgressIndicator()),
        );
        // List<Task> tasks = state.pendingTasks;
        // return CircularPercentIndicator(
        //   radius: 30.0,
        //   lineWidth: 7.0,
        //   animation: true,
        //   percent: tasks.length/10,
        //   circularStrokeCap: CircularStrokeCap.round,
        //   progressColor: const Color(0xFF939fdb),
        //   center: Container(
        //       height: 42,
        //       decoration: const BoxDecoration(
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //               fit: BoxFit.cover,
        //               image: AssetImage('assets/img/freddie3.jpg')))),
        //   // footer: Text("Sales this week", style: TextStyle(fontSize: 14),),
        // );
      }),
    );
  }
}