import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConstantsBR {
  final bohemiaRhapsodyColors = [
    const Color(0xFF882e6e),
    const Color(0xFFf25ca4),
    const Color(0xFFfb878b),
    const Color(0xFFff910f),
    const Color(0xFFfacd00),
    const Color(0xFFeb9adb),
    const Color(0xFFa35e1e),
    const Color(0xFFf3967a),
  ];

  final iconsPath = [
    SvgPicture.asset('assets/img/microphone.svg',   color: Colors.white,
                                      height: 70),
    SvgPicture.asset('assets/img/queen.svg',   color: Colors.white,
                                      height: 70),
    SvgPicture.asset('assets/img/piano.svg',   color: Colors.white,
                                      height: 70),
    SvgPicture.asset('assets/img/moustache.svg',   color: Colors.white,
                                      height: 70),
    SvgPicture.asset('assets/img/lp.svg',  color: Colors.white,
                                      height: 70)
  ];
}
