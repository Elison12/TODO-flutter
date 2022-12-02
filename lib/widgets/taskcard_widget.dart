import 'package:flutter/material.dart';

import '../models/task.dart';

final _lightscolors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100,
  const Color(0xfffeebe5),
  const Color(0xfffdf1db),
  const Color(0xffd3f3f1)
];

class TaskCardWidget extends StatelessWidget {
  final Task task;
  final int index;
  final List tasks;

  const TaskCardWidget(
      {Key? key, required this.task, required this.index, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _lightscolors[index % _lightscolors.length];
    final _createdTimeTask = task.createdTime.toString().substring(0, 11);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            // Tasks.removeAt(index);
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
                width: 350,
                color: color,
                //a cor da task é aqui
                margin: const EdgeInsets.only(left: 0),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          task.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.calendar_month, color: Colors.blueGrey,),
                              Text(_createdTimeTask, style: TextStyle(color: Colors.blueGrey)),
                            ],
                          ),
                        )
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
