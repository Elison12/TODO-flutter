import 'package:flutter/material.dart';

Container mycontainerwidget() {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: const BorderRadius.all(Radius.circular(4)),
    ),
    child: Stack(
      children: [
        // img
        Positioned(
          right: -15,
          bottom: -7,
          child: RotationTransition(
            turns: const AlwaysStoppedAnimation(25 / 360),
            child: Container(
              width: 83,
              height: 83,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/cebola.png"),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
              ),
            ),
          ),
        ),
        // text
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 11),
          child: Text("cebolitos",
              style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Raleway",
                  fontStyle: FontStyle.normal,
                  fontSize: 13.0),
              textAlign: TextAlign.left),
        ),
      ],
    ),
  );
}
