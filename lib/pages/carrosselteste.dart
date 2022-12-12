import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrosselTest extends StatefulWidget {
  const CarrosselTest({super.key});

  @override
  State<CarrosselTest> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CarrosselTest> {
  int _currentIndex = 0;

  List<Text> cardList = [
    Text("Open your eyes, look up to the skies", style: TextStyle(fontSize: 11)),
    Text("Love of my life, don’t leave me", style: TextStyle(fontSize: 12)),
    Text("We are the\n champions my friend", style: TextStyle(fontSize: 12))
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return  slidesongs();
  }

  Container slidesongs() {
    return Container(
        height: 50,
        width: 90,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 50.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            // aspectRatio: 3.0,
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
                width: 100,
                child: Card(
                  color: Colors.transparent,
                  child: card,
                ),
              );
            });
          }).toList(),
        ),
      );
  }
}
