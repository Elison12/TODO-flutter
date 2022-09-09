import 'package:flutter/material.dart';

class Clip extends StatefulWidget {
  const Clip({ Key? key }) : super(key: key);

  @override
  State<Clip> createState() => _ClipState();
}

class _ClipState extends State<Clip> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Dismissible(
              key: UniqueKey(),
              background: Container(
                decoration: ShapeDecoration(
                  color: Colors.red,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              secondaryBackground: Container(
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.red, Colors.green], // red to yellow
                    tileMode: TileMode.repeated,
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Hello, world!'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}