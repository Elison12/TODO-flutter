import 'package:flutter/material.dart';
import 'note.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  final int index;

  const NoteCardWidget({Key? key, required this.note, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key("$index"),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text("Done!"),
            ),
          );
        },
        background: Container(
          // margin: EdgeInsets.all(0),
          height: 100,
          width: 350,
          decoration: BoxDecoration(color: Colors.purple),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Container(
              margin: EdgeInsets.zero,
              height: 100,
              width: 350,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 26, 214, 214),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)
                      ),
                ),
              )),
        ));
  }
}
