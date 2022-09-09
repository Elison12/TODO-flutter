import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/models/task_model.dart';
import '../db/notes_database.dart';
import '../models/note.dart';
import 'addTask_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum _SelectedTab { tasks, importants, plan, myday }

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.tasks;
  late List<Note> notes;
  bool isLoading = false;
  // List todos = List();

  late final String date;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    NoteDataBase.instance.close();
    super.dispose();
    }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    notes = await NoteDataBase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  showAddTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "Adicionar tarefa",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Titulo",
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  Container(
                      child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "O que você está planejando ?",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14))),
                  )),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2022, 12, 12),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.pt);
                            },
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            )),
                      ),
                      Container(child: const Text("data aqui"))
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 235),
                      width: 45,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notification_add,
                              color: Colors.grey))),
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    height: 40.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          side:
                              const BorderSide(color: const Color(0xFF72b41a))),
                      onPressed: () {},
                      padding: const EdgeInsets.all(10.0),
                      color: const Color(0xFF72b41a),
                      textColor: Colors.white,
                      child: const Text("Confirmar",
                          style: const TextStyle(fontSize: 15)),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }

  // ignore: deprecated_member_use

  // List<Card> todos = List<Card>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text("Data de hoje",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            )
          ]),
      // body: Flex(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   direction: Axis.vertical,
      //   children: <Widget>[
      //     Expanded(
      //       child: tasks_list()),
      //   ],
      // ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : notes.isEmpty
                ? Text(
                    'No Notes',
                    style: const TextStyle(color: Colors.redAccent, fontSize: 24),
                  )
                : tasks_list(),
      ),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(icon: const Icon(Icons.task_alt)),
          DotNavigationBarItem(icon: const Icon(Icons.grade)),
          DotNavigationBarItem(icon: const Icon(Icons.calendar_month)),
          DotNavigationBarItem(icon: const Icon(Icons.light_mode)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddEditNotePage()));
          },
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add)),
    );
  }

  // ignore: non_constant_identifier_names
  ListView tasks_list() {
    return ListView.separated(
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return NoteCardWidget(note: note, index: index, notes: notes);
      },
      separatorBuilder: (context, int index) => const SizedBox(height: 8),
    );
  }
}
