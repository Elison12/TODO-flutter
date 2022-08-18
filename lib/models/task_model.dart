import 'package:flutter/material.dart';


Card buildTaskModel({required Color color, required String imagepath, required}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    child: Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
      height: 150,
      width: 400,
      padding:  const EdgeInsets.only(left: 20, top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("data", style: TextStyle(fontSize: 20, color: Colors.grey),),
              Text("title", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),)
            ],
          ),
          // Container(height: 100, width: 200, child: Image.asset("assets/images/tasks_card.png"))
          Container(height: 100, width: 200, child: Image.asset(imagepath))
        ],
      ),
    ),
  );
}