import 'package:flutter/material.dart';
import 'note.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  final int index;
  final List notes;

  const NoteCardWidget(
      {Key? key, required this.note, required this.index, required this.notes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Dismissible(
          key: Key("$index"),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            notes.removeAt(index);
            Scaffold.of(context)
                .showSnackBar(const SnackBar(behavior: SnackBarBehavior.floating, content: Text("Concluida")));
          },
          background: UnconstrainedBox(
                alignment: Alignment.centerRight,
                constrainedAxis: Axis.vertical,
              ),
          secondaryBackground: Container(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Icon(Icons.done),
            ),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  gradient: const LinearGradient(colors: [
                    Colors.green,
                    Colors.greenAccent,
                  ]),
                  // color: Colors.green,
                  // borderRadius: BorderRadius.circular(50)
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
              // borderRadius: BorderRadius.circular(50),
            ),
            child: const Card(
              //a cor da task é aqui
                margin: EdgeInsets.zero,
                child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ListTile(title: Text("const")))),
          ),
        ),
      ),
    );
  }
}
