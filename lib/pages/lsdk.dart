import 'package:flutter/material.dart';

class CollapsingToolbar extends StatelessWidget {
  // final String title;

  // CollapsingToolbar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {}),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: const  FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(
                    "title",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  /*background: Image.network(
                    "image url goes here",
                    fit: BoxFit.cover,
                  ),*/
                ),
              )
            ];
          },
          body: Center(
            child: Text("Hello World"),
          )
      ),
    );
  }
}