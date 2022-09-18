import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:todov2/db/tasks_database.dart';
import 'package:todov2/stores/newtask_store.dart';
import '../models/task.dart';

class AddTaskPage extends StatefulWidget {
  final Task? task;
  const AddTaskPage({super.key, this.task});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;

  late NewTaskStore _newTaskStore;

  late ReactionDisposer disposer;

  @override
  void dispose(){
    disposer();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _newTaskStore = Provider.of<NewTaskStore>(context);

    disposer = autorun((_){
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    title = widget.task?.title ?? '';
    description = widget.task?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova tarefa',
            style: TextStyle(color: Colors.blueGrey),
          ),
          // leading: GestureDetector(
          //     child: const Icon(
          //       Icons.close,
          //       color: Colors.blueGrey,
          //     ),
          //     onTap: () {
          //       Navigator.pop(context);
          //     }),
          // foregroundColor: Colors.blueGrey,
          backgroundColor: Colors.white,
          elevation: 0.0,
          // actions: [builderButton()],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Observer(builder: (context) {
                  return const TextField(
                      decoration: InputDecoration(
                          hintText: "Titulo",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)));
                })),
            const Divider(),
            Container(
                height: 150,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Observer(builder: (context) {
                  return TextField(
                      onChanged: _newTaskStore.setdescription,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                          hintText: "O que você está planejando ?",
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14))));
                })),
            Container(
              margin: const EdgeInsets.only(right: 300),
              child: IconButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2022, 12, 12), onChanged: (date) {
                    print('change $date');
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.pt);
                },
                icon: const Icon(Icons.calendar_month),
              ),
            ),
            buttomConfirm()
          ],
        ),
      );
  Widget builderButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: isFormValid ? null : Colors.grey.shade700),
          onPressed: addOrUpdateNote,
          child: const Text('Save'),
        ),
      );}
    );
  }

  Container buttomConfirm() {
    return Container(
      decoration: BoxDecoration(
        color: _newTaskStore.titleisvalid && _newTaskStore.descriptionvalid ? Colors.amber[400] : Colors.amber[50] 
      ),
      height: 50,
      child: TextButton(
          onPressed: addNote, child: Icon(Icons.confirmation_number_sharp)),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.task != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.task!.copy(title: title, description: description);
    await TaskDataBase.instance.update(note);
  }

  Future addNote() async {
    final note = Task(
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );
    await TaskDataBase.instance.create(note);
    Navigator.of(context).pop();
  }
}
