import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todov2/bloc/crud_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todov2/models/constants_br.dart';
import '../models/task.dart';

class DetailsTaskPage extends StatelessWidget {
  final int index;
  final ConstantsBR themedecoration = new ConstantsBR();

  DetailsTaskPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cardColors = themedecoration.bohemiaRhapsodyColors[
        index % themedecoration.bohemiaRhapsodyColors.length];

    final TextEditingController _newdescription = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //     ),
      //     onPressed: () {
      //       context.read<CrudBloc>().add(const FetchTodos());
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: SafeArea(child: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          if (state is DisplaySpecificTodo) {
            Task currentTask = state.task;

            return detailsfront(
                currentTask, context, cardColors, _newdescription);
          }
          return Stack();
        },
      )),
    );
  }

  Stack detailsfront(Task taskread, BuildContext context, Color themeColor,
      TextEditingController _newdescription) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                // Color(taskread.colortheme),
                Color(int.parse(taskread.colortheme)),
                // Color(0xFF862a69),
                Color(0xFF913393),
                Color(0xFFd279b1)
              ])),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 470, left: 160),
          child: Opacity(
            opacity: 0.4,
            child: SvgPicture.asset("assets/img/wac.svg",
                height: 200, width: 200, color: const Color(0xfffdc055)),
          ),
        ),
        Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 450, right: 170),
            child: Opacity(
              opacity: 0.9,
              child: Text(taskread.title,
                  style: const TextStyle(
                      color: Color(0xFFffbb58),
                      fontSize: 30,
                      fontFamily: 'PTSerif')),
            )),
        // margin: EdgeInsets.only(bottom: 570, right: 290),

        Container(
            height: 490,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)))),
        ListView(
          padding: const EdgeInsets.only(top: 180, left: 8, right: 8),
          children: <Widget>[
            const Divider(),
            Container(
                height: 150,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: const Color(0xFFf8f8f8)),
                child: TextFormField(
                    initialValue: taskread.description,
                    enabled: false,
                    style: TextStyle(fontSize: 20),
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "O que você está planejando ?",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14))))),
            const SizedBox(height: 170),
            //botões
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
                    context.read<CrudBloc>().add(const FetchTodos());
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    backgroundColor: const Color(0xFF07e2ba),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20 * 1.5, vertical: 20),
                  ),
                  child: const Text('Editar'),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (builder) {
                          return ListView(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFf8f8f8),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0))),
                                child: Container(
                                    height: 200,
                                    margin: EdgeInsets.all(8.0),
                                    decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        color: Color(0xFFf8f8f8)),
                                    child: TextFormField(
                                        // initialValue: taskread.description,
                                        enabled: true,
                                        controller: _newdescription,
                                        minLines: 1,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                            hintText:
                                                "O que você está planejando ?",
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14))))),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 40),
                                  child: BlocBuilder<CrudBloc, CrudState>(
                                      builder: (context, state) {
                                    return ElevatedButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        backgroundColor:
                                            const Color(0xFF07e2ba),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15 * 1.5, vertical: 20),
                                      ),
                                      child: const Text("Salvar"),
                                      onPressed: () async {
                                        if (_newdescription.text.isNotEmpty) {
                                          context.read<CrudBloc>().add(
                                              UpdateTodo(
                                                  task: Task(
                                                      id: taskread.id,
                                                      title: taskread.title,
                                                      description: _newdescription.text,
                                                      createdTime: taskread.createdTime,
                                                      colortheme: taskread.colortheme
                                                  )
                                              )
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  duration:
                                                      Duration(seconds: 1),
                                                  content: Text(
                                                      "Tarefa atualizada !")));
                                          Navigator.of(context).popUntil((route) => route.isFirst);
                                          context
                                              .read<CrudBloc>()
                                              .add(const FetchTodos());
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "A Descrição não pode ser vazia !"
                                                          .toUpperCase())));
                                        }
                                      },
                                    );
                                  })),
                            ],
                          );
                        });
                  },
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
