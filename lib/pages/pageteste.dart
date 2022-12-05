import 'package:flutter/material.dart';
import 'package:todov2/widgets/mycontainer_widget.dart';

class PageTest extends StatelessWidget {
  const PageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: mycontainerwidget(),
      ),
    );
  }
}