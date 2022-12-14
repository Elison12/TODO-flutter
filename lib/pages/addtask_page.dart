import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/crud_bloc.dart';
import '../models/constants_br.dart';
import '../models/task.dart';
import '../widgets/colorpicker_widget.dart';
import '../widgets/horizontalCalendar_widget.dart';

class AddTaskPage extends StatefulWidget {
  final Task? task;
  const AddTaskPage({super.key, this.task});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  late Color _colortheme;

  ConstantsBR colorspicker = ConstantsBR();

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: backgroundObject()),
      );

  Stack backgroundObject() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                Color(0xFF862a69),
                Color(0xFF913393),
                Color(0xFFd279b1)
              ])),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 470, left: 160),
          child: Opacity(
            opacity: 0.4,
            child: SvgPicture.asset("assets/img/wac.svg",
                height: 190, width: 190, color: const Color(0xfffdc055)),
          ),
        ),
        Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 450, right: 170),
            child: Opacity(
              opacity: 0.9,
              child: const Text('Nova tarefa',
                  style: TextStyle(
                      color: Color(0xFFffbb58),
                      fontSize: 30,
                      fontFamily: 'PTSerif')),
            )),
        Container(
            height: 490,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)))),
        ListView(
          padding: const EdgeInsets.only(top: 180, left: 8, right: 8),
          children: <Widget>[
            calendarWidget(),
            Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: const Color(0xFFf8f8f8)),
                child: TextField(
                    controller: _title,
                    decoration: const InputDecoration(
                        hintText: "Titulo",
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)))),
            const Divider(),
            Container(
                height: 150,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: const Color(0xFFf8f8f8)),
                child: TextField(
                    controller: _description,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "O que você está planejando ?",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14))))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ColorPickerWidget(
                  availableColors: colorspicker.bohemiaRhapsodyColors,
                  circleItem: true,
                  initialColor: colorspicker.bohemiaRhapsodyColors[0],
                  onSelectColor: (value) {
                    setState(() {
                      _colortheme = value;
                      print(_colortheme);
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    backgroundColor: const Color(0xfffe5b78),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15 * 1.5, vertical: 20),
                  ),
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<CrudBloc, CrudState>(builder: (context, state) {
                  return ElevatedButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor: const Color(0xFF07e2ba),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20 * 1.5, vertical: 20),
                    ),
                    child: Text('Salvar'),
                    onPressed: () {
                      if (_title.text.isNotEmpty &&
                          _description.text.isNotEmpty) {
                        context.read<CrudBloc>().add(
                              AddTodo(
                                  title: _title.text,
                                  description: _description.text,
                                  createdTime: DateTime.now(),
                                  colortheme: _colortheme
                                      .toString()
                                      .substring(6, 16) // colortheme: v
                                  ),
                            );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Tarefas adicionada !"),
                        ));
                        context.read<CrudBloc>().add(const FetchTodos());
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "titulo e descrição não podem ser vazias !"
                                  .toUpperCase()),
                        ));
                      }
                    },
                  );
                }),
              ],
            )
          ],
        )
      ],
    );
  }
}
