import 'package:flutter/material.dart';


class CalendarHome extends StatelessWidget {
  const CalendarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(height: 20, width: 50, child: Text(DateTime.now().toString())),
        ],
      ),
    );
  }
}