import 'package:flutter/cupertino.dart';

extension BuildContextExt on BuildContext {
  double sH() => MediaQuery.of(this).size.height;
  double sW() => MediaQuery.of(this).size.width;
  // double dpr() => MediaQuery.of(this).devicePixelRatio;
  // double sWbH() {
  //   return sH() >= sW()
  //       ? (sH() + 29.1 + MediaQuery.of(this).padding.bottom) / sW()
  //       : (sW() + 29.1 + MediaQuery.of(this).padding.bottom) / sH();
  // }

  double wH(double fraction) {
    // final dpr = MediaQuery.of(this).devicePixelRatio;
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    // log('shortestside : $shortestSide');
    // log('dpr : $dpr');
    // log('result : ${shortestSide * fraction}');
    return (shortestSide * fraction);
  }
  double wW(double fraction) {
    // final dpr = MediaQuery.of(this).devicePixelRatio;
    final shortestSide = MediaQuery.of(this).size.longestSide;
    // log('shortestside : $shortestSide');
    // log('dpr : $dpr');
    // log('result : ${shortestSide * fraction}');
    return (shortestSide * fraction);
  }

  double ls() => MediaQuery.of(this).size.longestSide;

  bool isSmallScreen() => sW() < 800;

  bool isLargeScreen() => sW() > 1200;

  bool isMediumScreen() => sW() >= 800 && sW() <= 1200;

  bool isSmallScreen2() => sW() > 1000;
}