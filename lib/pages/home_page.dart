import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todov2/bloc/crud_bloc.dart';
import 'package:todov2/pages/addtask_page.dart';
import 'package:todov2/pages/datailstask_page.dart';
import 'package:todov2/stores/counterprogress.dart';
import '../animations/scaletransition.dart';
import '../animations/slidetransitionone.dart';
import '../widgets/cirularteste.dart';
import '../widgets/taskcard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  DateTime time = DateTime.now();

  late final String date;

  CounterProgress counter = CounterProgress();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CrudBloc, CrudState>(builder: (context, state) {
        if (state is CrudInitial) {
          context.read<CrudBloc>().add(const FetchTodos());
        }
        if (state is DisplayTodos) {
          return Column(children: [
            Expanded(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : CustomScrollView(
                        slivers: <Widget>[
                          //2
                          SliverAppBar(
                            pinned: false,
                            floating: true,
                            snap: false,
                            backgroundColor: Colors.transparent,
                            automaticallyImplyLeading: true,
                            expandedHeight: 180.0,
                            leading: IconButton(
                              icon: const Icon(Icons.menu, color: Colors.white),
                              onPressed: () {},
                            ),
                            actions: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ))
                            ],
                            flexibleSpace: FlexibleSpaceBar(
                                titlePadding: const EdgeInsetsDirectional.only(
                                    start: 38, bottom: 20),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const CircularCrud(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Text(
                                          DateFormat("EEE", "pt_BR")
                                              .format(time)
                                              // .substring(0, 7)
                                              .toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Text(
                                            DateTime.now()
                                                .toString()
                                                .substring(8, 11),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.amber,
                                                fontWeight: FontWeight.w800))),
                                  ],
                                ),
                                background: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                          Color(0xFF862a69),
                                          Color(0xFF913393),
                                          Color(0xFFd279b1)
                                        ])),
                                  ),
                                )),
                          ),
                          //3
                          SliverToBoxAdapter(
                              child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 15, left: 15),
                              child: Text("Minhas Tarefas",
                                  style: TextStyle(
                                      color: Color(0xFFffbb58),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PTSerif')),
                            ),
                          )),
                          state.task.isEmpty
                              ? SliverToBoxAdapter(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 80),
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Container(
                                            height: 40,
                                            child: SvgPicture.asset(
                                              "assets/img/check-mark-svgrepo-com.svg",
                                              color: Color(0xFF939fdb),
                                            )),
                                        Text("Sem tarefas",
                                            style: TextStyle(
                                                color: Color(0xFF939fdb),
                                                fontSize: 18)),
                                      ],
                                    )),
                                  ),
                                )
                              : SliverPadding(
                                  padding:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  sliver: SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (_, int index) {
                                        return InkWell(
                                          onTap: () {
                                            context.read<CrudBloc>().add(
                                                FetchSpecificTodo(
                                                    id: state.task[index].id!));
                                            Navigator.push(
                                                context,
                                                SlideTransition1(
                                                    DetailsTaskPage(
                                                        index: index)));
                                          },
                                          child: TaskCardWidget(
                                              task: state.task[index],
                                              index: index,
                                              tasks: state.task),
                                        );
                                      },
                                      childCount: state.task.length,
                                    ),
                                  ),
                                )
                        ],
                      )),
          ]);
        }
        return Container(
          color: const Color(0xFF939fdb),
          child: const Center(child: CircularProgressIndicator()),
        );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(ScalaTransition(const AddTaskPage()));
          },
          backgroundColor: const Color(0xFF8b3694),
          child: const Icon(Icons.add)),
    );
  }
}
