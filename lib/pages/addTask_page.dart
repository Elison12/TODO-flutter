import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../db/notes_database.dart';
import '../models/note.dart';
import '../widget/task_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({Key? key, this.note}) : super(key: key);

  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Nova tarefa', style: TextStyle(color: Colors.blueGrey),),
          leading: GestureDetector(
              child: const Icon(
                Icons.close,
                color: Colors.blueGrey,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          // foregroundColor: Colors.blueGrey,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [builderButton()],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: "Titulo",
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            const Divider(),
            Container(
                height: 150,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: TextField(
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "O que você está planejando ?",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(14))),
                )),
            // Container(
            //   margin: EdgeInsets.only(right: 300),
            //   child: IconButton(
            //     onPressed: () {
            //       DatePicker.showDatePicker(context,
            //           showTitleActions: true,
            //           minTime: DateTime.now(),
            //           maxTime: DateTime(2022, 12, 12), onChanged: (date) {
            //         print('change $date');
            //       }, onConfirm: (date) {
            //         print('confirm $date');
            //       }, currentTime: DateTime.now(), locale: LocaleType.pt);
            //     },
            //     icon: const Icon(Icons.calendar_month),
            //   ),
            // ),
          ],
        ),
      );

  Form Formwidget() {
    return Form(
        key: _formKey,
        child: NoteFormWidget(
          // isImportant: isImportant,
          // number: number,
          title: title,
          description: description,
          onChangedImportant: (isImportant) =>
              setState(() => this.isImportant = isImportant),
          onChangedNumber: (number) => setState(() => this.number = number),
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
        ));
  }

  Widget builderButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: isFormValid ? null : Colors.grey.shade700),
        onPressed: addOrUpdateNote,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(title: title, description: description);
    await NoteDataBase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );
    await NoteDataBase.instance.create(note);
  }
}
