import 'package:flutter/material.dart';

class NewHomeTst extends StatefulWidget {
  const NewHomeTst({super.key});

  @override
  State<NewHomeTst> createState() => _NewHomeTstState();
}

class _NewHomeTstState extends State<NewHomeTst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Goa', textScaleFactor: 1),
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  child: Image.asset(
                    'assets/img/newtask.png',
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
