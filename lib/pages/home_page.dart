import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:intl/intl.dart';
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

  DateTime time = DateTime.now();
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

  // List<Card> todos = List<Card>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(DateFormat("EEEE", "pt_BR").format(time),
              style: const TextStyle(
                fontFamily: "Cardo-regular",
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.blueGrey),
            )
          ]),

      body: Column(children: [
        // calendarWidget(),
        Expanded(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'No Notes',
                      style: TextStyle(color: Colors.redAccent, fontSize: 24),
                    )
                  : tasks_list(),
        ),
      ]),
      // Center(
      //   child: isLoading
      //       ? CircularProgressIndicator()
      //       : notes.isEmpty
      //           ? const Text(
      //               'No Notes',
      //               style:
      //                   TextStyle(color: Colors.redAccent, fontSize: 24),
      //             )
      //           : tasks_list(),
      // ),
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

  Container calendarWidget() {
    return Container(
      height: 100,
      // child: AnimatedHorizontalCalendar(
      //     tableCalenderIcon: Icon(
      //       Icons.calendar_today,
      //       color: Colors.white,
      //     ),
      //     date: DateTime.now(),
      //     textColor: Colors.black45,
      //     backgroundColor: Colors.white,
      //     tableCalenderThemeData: ThemeData.light().copyWith(
      //       primaryColor: Colors.green,
      //       accentColor: Colors.red,
      //       colorScheme: ColorScheme.light(primary: Colors.green),
      //       buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      //     ),
      //     selectedColor: Colors.redAccent,
      //     onDateSelected: (date) {
      //       // selectedDate = date;
      //     }),
    );
  }
}
