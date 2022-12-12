import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideCarrossel extends StatefulWidget {
  const SlideCarrossel({super.key});

  @override
  State<SlideCarrossel> createState() => _SlideCarrosselState();
}

class _SlideCarrosselState extends State<SlideCarrossel> {
  int _currentIndex = 0;

  List<Text> cardList = [Text("text1"), Text("text2"), Text("text3")];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: cardList.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: 50,
            width: 50,
            child: Card(
              color: Colors.blueAccent,
              child: card,
            ),
          );
        });
      }).toList(),
    );
  }

  // Text text1() {
  //   return Text("text1");
  // }

  
  // Text text2() {
  //   return Text("text2");
  // }
  
  // Text text3() {
  //   return Text("text3");
  // }
}
