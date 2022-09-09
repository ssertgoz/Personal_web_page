import 'package:flutter/material.dart';

// Our design contains Neumorphism design and i made a extention for it
// We can apply it on any  widget

extension Neumorphism on Widget {
  addNeumorphism(
      {double borderRadius = 50.0,
      Offset offset = const Offset(2, 3),
      double blurRadius = 5,
      Color topShadowColor = Colors.white60,
      Color bottomShadowColor = Colors.black,
      double spreadRadius = 0.2}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
              offset: offset,
              blurRadius: blurRadius,
              color: bottomShadowColor,
              spreadRadius: spreadRadius),
          BoxShadow(
              offset: Offset(-offset.dx, -offset.dx),
              blurRadius: blurRadius,
              color: topShadowColor,
              spreadRadius: spreadRadius),
        ],
      ),
      child: this,
    );
  }
}
