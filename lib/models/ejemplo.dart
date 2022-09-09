import 'package:flutter/material.dart';

class ExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              secondaryBackground: Container(color: Colors.green),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.red, Colors.green],
                    ),
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ListTile(title: Text('Solution One')),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: borderRadius,
            child: Dismissible(
              key: UniqueKey(),
              background: UnconstrainedBox(
                alignment: Alignment.centerRight,
                constrainedAxis: Axis.vertical,
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: borderRadius,
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: const Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ListTile(title: Text('Solution Two')),
                ),
              ),
            ),
          ),         
        ],
      ),
    );
  }
}
