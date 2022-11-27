import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todov2/bloc/crud_bloc.dart';
import 'package:todov2/pages/addtask_page.dart';
import '../widgets/taskcard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum _SelectedTab { tasks, importants, plan, myday }

class _HomePageState extends State<HomePage> {
  var _selectedTab = _SelectedTab.tasks;
  bool isLoading = false;

  DateTime time = DateTime.now();

  late final String date;

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
      body: BlocBuilder<CrudBloc, CrudState>(builder: (context, state) {
        if (state is CrudInitial) {
          context.read<CrudBloc>().add(const FetchTodos());
        }
        if (state is DisplayTodos) {
          return Column(children: [
            Expanded(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : state.task.isEmpty
                        ? const Text(
                            'Sem tarefas',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 24),
                          )
                        : ListView.separated(
                            itemCount: state.task.length,
                            itemBuilder: (BuildContext context, int index) {
                              final task = state.task[index];
                              return TaskCardWidget(
                                  task: task, index: index, tasks: state.task);
                            },
                            separatorBuilder: (context, int index) =>
                                const SizedBox(height: 8),
                          )),
          ]);
        }
        return Container(
          color: Colors.white,
          child: const Center(child: CircularProgressIndicator()),
        );
      }),
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
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddTaskPage()));
            // showModalBottomSheet(
            //     context: context,
            //     shape: const RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(25))),
            //     builder: (context) {
            //       return SizedBox(
            //           height: 200,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisSize: MainAxisSize.min,
            //           ));
            //     });
          },
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add)),
    );
  }
}
