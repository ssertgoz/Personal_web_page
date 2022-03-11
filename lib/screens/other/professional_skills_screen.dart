// @dart=2.9
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../constants/colors.dart';

class ProfessionalSkillsScreen extends StatefulWidget {
  const ProfessionalSkillsScreen({Key key}) : super(key: key);

  @override
  State<ProfessionalSkillsScreen> createState() =>
      _ProfessionalSkillsScreenState();
}

class _ProfessionalSkillsScreenState extends State<ProfessionalSkillsScreen>
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
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
              height: Get.height, width: Get.width, color: customWhiteColor),
          RotatedBox(
            quarterTurns: 2,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image:
                            AssetImage("assets/images/professionalSkills.png")),
                  ),
                  child: null),
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
                        margin: EdgeInsets.only(top: Get.height * 0.1),
                        height: Get.height * 0.1,
                        width: Get.width * 0.5,
                        alignment: Alignment.center,
                        child: Text(
                          "PROFESSIONAL SKILLS",
                          style: TextStyle(
                              color: customDarkBlueColor,
                              fontSize: Get.width * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          height: 1,
                          width: Get.width * 0.35,
                          margin: EdgeInsets.all(Get.width * 0.01),
                          color: customDarkBlueColor),
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
