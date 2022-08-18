import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:todo_app/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum _SelectedTab { tasks, importants, plan, myday }

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.tasks;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("Data de hoje",
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTaskModel(color: Color(0xFFed74b4), imagepath: "assets/images/tasks_card.png"),
            buildTaskModel(color: Color(0xFF6b48f9), imagepath: 'assets/images/run_card.png'),
            buildTaskModel(color: Color(0xFFffe5a5), imagepath: 'assets/images/buy_card.png'),
            buildTaskModel(color: Color(0xFFffe5a5), imagepath: 'assets/images/buy_card.png'),
            // buildTaskModel(color: Colors.white10, imagepath: 'images/run_card'),
          ],
        ),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(icon: Icon(Icons.task_alt)),
          DotNavigationBarItem(icon: Icon(Icons.grade)),
          DotNavigationBarItem(icon: Icon(Icons.calendar_month)),
          DotNavigationBarItem(icon: Icon(Icons.light_mode)),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, 
        backgroundColor: Colors.blue,
        child: Icon(Icons.add)
      ),
    );
  }
}
