import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todov2/bloc/crud_bloc.dart';
import 'package:todov2/pages/addtask_page.dart';
import 'package:todov2/pages/datailstask_page.dart';
import 'package:todov2/widgets/circularprogress_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // backgroundColor: const Color(0xFF939fdb),
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     elevation: 0.0,
      //     backgroundColor: Colors.white,
      //     title: Text(DateFormat("EEEE", "pt_BR").format(time),
      //         style: const TextStyle(
      //           fontFamily: "Cardo-regular",
      //           color: Colors.blueGrey,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 25,
      //         )),
      //     actions: [
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(Icons.search, color: Colors.blueGrey),
      //       )
      //     ]),
      body: BlocBuilder<CrudBloc, CrudState>(builder: (context, state) {
        if (state is CrudInitial) {
          context.read<CrudBloc>().add(const FetchTodos());
        }
        if (state is DisplayTodos) {
          return Column(children: [
            // Container(height: 40, child: Text('Minhas tarefas')),
            Expanded(
                child: isLoading
                    ? const CircularProgressIndicator()
                    // : state.task.isEmpty
                    //     ? const Center(
                    //         child: Text(
                    //           'Sem tarefas',
                    //           style: TextStyle(
                    //               color: Colors.redAccent, fontSize: 24),
                    //         ),
                    //       )
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
                                  children: const <Widget>[
                                    Circularprogresswidget()
                                  ],
                                ),
                                background: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        // color: Color(0xFF3f51b5)
                                        // color: Color(0xFF8b3694)
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            // stops: [0.3, 1],
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
                                      // color: Color(0xFF939fdb),
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
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    DetailsTaskPage(index: index)),
                                              ),
                                            );
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
      // bottomNavigationBar: DotNavigationBar(
      //   currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      //   onTap: _handleIndexChanged,
      //   items: [
      //     DotNavigationBarItem(icon: const Icon(Icons.task_alt)),
      //     DotNavigationBarItem(icon: const Icon(Icons.grade)),
      //     DotNavigationBarItem(icon: const Icon(Icons.calendar_month)),
      //     DotNavigationBarItem(icon: const Icon(Icons.light_mode)),
      //   ],
      // ),
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
          // backgroundColor: const Color(0xFF3f51b5),
          backgroundColor: const Color(0xFF8b3694),
          child: const Icon(Icons.add)),
    );
  }
}
