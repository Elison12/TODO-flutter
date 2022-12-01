import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todov2/bloc/circularProgress/circularProgress_bloc.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Circulo de progresso"),
      ),
      body: Center(
        child: BlocConsumer<CircularProgressBloc, CircularProgressState>(
            listener: (context, state) {
          if (state is IncrementState) {
            print("aumento");
          } else if (state is DecrementState) {
            print("diminuiu");
          }
        }, builder: (context, state) {
          return CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 13.0,
            animation: true,
            percent: state.progress,
            center: Container(
                height: 90,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, image: DecorationImage(image: AssetImage('assets/img/freddie.jpg')))),
            // footer: Text("Sales this week", style: TextStyle(fontSize: 14),),
            circularStrokeCap: CircularStrokeCap.square,
            progressColor: Colors.redAccent,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => context
              .read<CircularProgressBloc>()
              .add(ProgressIncrementEvent())),
    );
  }
}
