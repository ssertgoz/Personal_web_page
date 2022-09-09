// @dart=2.9
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../constants/colors.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;
  Animation _rowAnimation;
  AnimationController _rowAnimationController;
  bool animationFinished = false;
  bool showText = false;

  List<Widget> items = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:
              EdgeInsets.only(right: Get.height * 0.2, left: Get.height * 0.2),
          padding: EdgeInsets.all(Get.height * 0.02),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0.1)
            ],
          ),
          height: Get.height * 0.3,
          width: Get.height * 0.3,
          child: Image(image: AssetImage("assets/images/iyte_logo.png")),
        ),
        Container(
          margin: EdgeInsets.all(Get.height * 0.02),
          child: Text(
            "İZMİR INSTITUTE OF TECHNOLOGY",
            style: TextStyle(
                color: customBlackColor,
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            "Computer Engineering",
            style: TextStyle(
                color: customBlackColor.withOpacity(0.6),
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.all(Get.height * 0.01),
          child: Text(
            "2018 September - 2023 June",
            style: TextStyle(
                color: customBlackColor.withOpacity(0.6),
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Row(
            children: [
              Flag.fromCode(
                FlagsCode.TR,
                height: Get.height * 0.035,
                width: Get.height * 0.05,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              Text(
                "Turkey",
                style: TextStyle(
                    color: customBlackColor.withOpacity(0.6),
                    fontSize: Get.height * 0.03,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:
              EdgeInsets.only(right: Get.height * 0.2, left: Get.height * 0.2),
          padding: EdgeInsets.all(Get.height * 0.02),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0.1)
            ],
          ),
          height: Get.height * 0.3,
          width: Get.height * 0.3,
          child: Image(image: AssetImage("assets/images/UDS_logo.png")),
        ),
        Container(
          margin: EdgeInsets.all(Get.height * 0.02),
          child: Text(
            "Universität des Saarlandes".toUpperCase(),
            style: TextStyle(
                color: customBlackColor,
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            "Computer Science (Erasmus)",
            style: TextStyle(
                color: customBlackColor.withOpacity(0.6),
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.all(Get.height * 0.01),
          child: Text(
            "2022 April - 2022 August",
            style: TextStyle(
                color: customBlackColor.withOpacity(0.6),
                fontSize: Get.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Row(
            children: [
              Flag.fromCode(
                FlagsCode.DE,
                height: Get.height * 0.035,
                width: Get.height * 0.05,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: Get.width * 0.01,
              ),
              Text(
                "Germany",
                style: TextStyle(
                    color: customBlackColor.withOpacity(0.6),
                    fontSize: Get.height * 0.03,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(begin: 5.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.ease, parent: _animationController));

    _rowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _rowAnimation = Tween(begin: 30.0, end: 40.0).animate(
        CurvedAnimation(curve: Curves.ease, parent: _rowAnimationController));

    _rowAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _rowAnimationController.repeat();
      }
    });
    _rowAnimationController.forward();
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.forward) {
        animationFinished = true;
      } else if (status == AnimationStatus.reverse) {
        animationFinished = false;
      }
      if (animationFinished && status == AnimationStatus.completed) {
        showText = true;
      } else {
        showText = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _rowAnimationController?.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
              height: height,
              width: width,
              color: Color.fromRGBO(255, 255, 255, 1)),
          RotatedBox(
            quarterTurns: 2,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage("assets/images/landscape_gradient.png")),
                  ),
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          customBlackColor.withOpacity(0.0),
                          customBlackColor.withOpacity(0.3),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.1),
                        height: height * 0.1,
                        width: width * 0.3,
                        alignment: Alignment.center,
                        child: Text(
                          "EDUCATION",
                          style: TextStyle(
                              color: customWhiteColor,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          height: 1,
                          width: width * 0.35,
                          margin: EdgeInsets.all(width * 0.02),
                          color: customWhiteColor),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: items,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
