import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/crud_bloc.dart';
import '../models/task.dart';
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

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,

        // appBar: AppBar(
        //   leading: GestureDetector(
        //       child: const Icon(
        //         Icons.close,
        //         color: Colors.white,
        //       ),
        //       onTap: () {
        //         Navigator.pop(context);
        //       }),
        //   foregroundColor: Colors.blueGrey,
        //   backgroundColor: const Color(0xFF4144ca),
        //   elevation: 0.0,
        //   // actions: [builderButton()],
        // ),
        body: SafeArea(child: backgroundObject()),

        // body: ListView(
        //   padding: const EdgeInsets.all(8.0),
        //   children: <Widget>[
        //     Container(
        //         decoration: const BoxDecoration(color: Colors.transparent),
        //         child: TextField(
        //             controller: _title,
        //             decoration: const InputDecoration(
        //                 hintText: "Titulo",
        //                 border:
        //                     OutlineInputBorder(borderSide: BorderSide.none)))),
        //     const Divider(),
        //     Container(
        //         height: 150,
        //         decoration: const BoxDecoration(color: Colors.transparent),
        //         child: TextField(
        //             controller: _description,
        //             minLines: 1,
        //             maxLines: 5,
        //             decoration: InputDecoration(
        //                 hintText: "O que você está planejando ?",
        //                 border: OutlineInputBorder(
        //                     borderSide: BorderSide.none,
        //                     borderRadius: BorderRadius.circular(14))))),
        //     Container(
        //       margin: const EdgeInsets.only(right: 300),
        //       child: IconButton(
        //         onPressed: () {
        //           DatePicker.showDatePicker(context,
        //               showTitleActions: true,
        //               minTime: DateTime.now(),
        //               maxTime: DateTime(2022, 12, 12), onChanged: (date) {
        //             print('change $date');
        //           }, onConfirm: (date) {
        //             print('confirm $date');
        //           }, currentTime: DateTime.now(), locale: LocaleType.pt);
        //         },
        //         icon: const Icon(Icons.calendar_month),
        //       ),
        //     ),
        //     Container(
        //       child:
        //           BlocBuilder<CrudBloc, CrudState>(builder: (context, state) {
        //         return ElevatedButton(
        //           child: Text('Salvar'),
        //           style:
        //               ElevatedButton.styleFrom(foregroundColor: Colors.white),
        //           onPressed: () {
        //             if (_title.text.isNotEmpty &&
        //                 _description.text.isNotEmpty) {
        //               context.read<CrudBloc>().add(
        //                     AddTodo(
        //                       // id:  1,
        //                       title: _title.text,
        //                       description: _description.text,
        //                       createdTime: DateTime.now(),
        //                     ),
        //                   );
        //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //                 duration: Duration(seconds: 1),
        //                 content: Text("Tarefas adicionada !"),
        //               ));
        //               context.read<CrudBloc>().add(const FetchTodos());
        //               Navigator.pop(context);
        //             } else {
        //               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //                 content: Text(
        //                     "titulo e descrição não podem ser vazias !"
        //                         .toUpperCase()),
        //               ));
        //             }
        //           },
        //         );
        //       }),
        //     )
        //   ],
        // ),
      );

  Stack backgroundObject() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          margin: EdgeInsets.zero,
          // color: const Color(0xFF3f51b5),
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
                color: const Color(0xfffdc055)),
          ),
          // decoration: BoxDecoration(
          //     // image: DecorationImage(image: ExactAssetImage('assets/img/newtask.png'))
          //     image: DecorationImage(
          //         image: SvgPicture.asset()))
        ),
        // Container(
        //     margin: const EdgeInsets.only(bottom: 570, right: 300),
        //     child: IconButton(
        //         onPressed: () {
        //           print("clicou");
        //           Navigator.pop(context);
        //         },
        //         icon: const Icon(
        //           Icons.arrow_back_ios_new,
        //           color: Color(0xFF585eff),
        //         ))),
        Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 450, right: 170),
            child: Opacity(
              opacity: 0.9,
              child: const Text('Nova tarefa',
                  style: TextStyle(
                      color: Color(0xFFffbb58), fontSize: 30, fontFamily: 'PTSerif')),
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
                  // style: ButtonStyle(backgroundColor: Colors.red),
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
                    // style: ElevatedButton.styleFrom(
                    //     foregroundColor: Colors.white),
                    onPressed: () {
                      if (_title.text.isNotEmpty &&
                          _description.text.isNotEmpty) {
                        context.read<CrudBloc>().add(
                              AddTodo(
                                // id:  1,
                                title: _title.text,
                                description: _description.text,
                                createdTime: DateTime.now(),
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
