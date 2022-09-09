import 'package:flutter/material.dart';
import 'note.dart';

final _lightscolors = [
 Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatelessWidget {
  final Note note;
  final int index;
  final List notes;

  const NoteCardWidget(
      {Key? key, required this.note, required this.index, required this.notes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _lightscolors[index % _lightscolors.length];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Dismissible(
          key: Key("$index"),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            notes.removeAt(index);
            Scaffold.of(context)
                .showSnackBar(const SnackBar(behavior: SnackBarBehavior.floating, content: Text("Concluida")));
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  gradient: const LinearGradient(colors: [
                    Colors.green,
                    Colors.greenAccent,
                  ]),
              )
          ),
          child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                margin: EdgeInsets.only(left: 0),
                child: const Padding(
                    // padding: EdgeInsets.all(60),
                    padding: EdgeInsets.all(27),
                    child: Text("Const")
                )
            ),
            ),
          ),
        ),
    );
  }
}
