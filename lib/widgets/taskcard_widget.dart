import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:todov2/bloc/crud_bloc.dart';
import 'package:todov2/models/constants_br.dart';
import 'dart:math' as math;
import '../bloc/crud_bloc.dart';
import '../models/constants_br.dart';
import '../models/task.dart';

final _lightscolors = [
  const Color(0xFFe8a14c),
  const Color(0xFF9c5c8c),
  const Color(0xFFefecf3),
  const Color(0xFFeaa44e),
  const Color(0xFFa81d23),
  const Color(0xFFf4bb6c),
  const Color(0xFFd088b8)
];

class TaskCardWidget extends StatelessWidget {
  final Task task;
  final int index;
  final List tasks;

  final ConstantsBR themedecoration = new ConstantsBR();

  TaskCardWidget(
      {Key? key, required this.task, required this.index, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColors = themedecoration.bohemiaRhapsodyColors[
        index % themedecoration.bohemiaRhapsodyColors.length];

    final iconDecoration =
        themedecoration.iconsPath[index % themedecoration.iconsPath.length];
    final _createdTimeTask = task.createdTime.toString().substring(0, 11);

    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BlocBuilder<CrudBloc, CrudState>(builder: (context, state) {
          if (state is DisplayTodos) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                context
                    .read<CrudBloc>()
                    .add(DeleteTodo(id: state.task[index].id!));
                tasks.remove(index);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("Concluída")));
              },
              background: const UnconstrainedBox(
                alignment: Alignment.centerRight,
                constrainedAxis: Axis.vertical,
              ),
              secondaryBackground: Container(
                  child: Container(
                    margin: EdgeInsets.only(right: 50),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.done),
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    gradient: const LinearGradient(colors: [
                      Colors.green,
                      Colors.greenAccent,
                    ]),
                  )),
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.greenAccent,
                    ],
                  ),
                ),
                child: Container(
                    color: cardColors,
                    width: 350,
                    //a cor da task é aqui
                    margin: const EdgeInsets.only(left: 0),
                    child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 0.8,
                                  child: Text(
                                    task.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Cardo-Regular',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Colors.blueGrey,
                                      ),
                                      Text(_createdTimeTask.substring(5),
                                          style: const TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 25)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Transform.rotate(
                                angle: math.pi / 4,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: iconDecoration,
                                ))
                            // ),
                          ],
                        ))),
              ),
            );
          }
          return Container(
              color: const Color(0xFF939fdb),
              child: const Center(child: CircularProgressIndicator()));
        }),
      ),
    );
  }
}
