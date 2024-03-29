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
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  customWhiteColor,
                ])),
            child: const Opacity(
              opacity: 0.5,
              child: Image(
                image: AssetImage("assets/images/13038.jpg"),
              ),
            ),
          ),
          // Container(
          //   height: height,
          //   width: width,
          //   decoration: BoxDecoration(
          //       color: Color.fromRGBO(255, 255, 255, 1),
          //       gradient: LinearGradient(
          //         stops: [0.3, 0.8],
          //         colors: [
          //           Colors.transparent,
          //           Color.fromRGBO(255, 255, 255, 1)
          //         ],
          //       )),
          // ),
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
                        width: width * 0.8,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "PROFESSIONAL SKILLS",
                            style: TextStyle(
                                color: customBlackColor,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                          height: 1,
                          width: width * 0.5,
                          margin: EdgeInsets.all(width * 0.01),
                          color: customBlackColor),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      Expanded(
                        child: Container(
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [getMobil(), getWeb(), getOthers()],
                          ),
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

  getOthers() {
    var width = context.width;
    var height = context.height;
    return Expanded(
        child: Container(
      decoration:
          BoxDecoration(color: Color.fromRGBO(125, 125, 165, 0.8), boxShadow: [
        BoxShadow(
          color: customBlackColor.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      margin: EdgeInsets.all(width * 0.01),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: width * 0.01),
            child: Text(
              "OTHERS",
              style: TextStyle(
                  color: customDarkBlueColor,
                  fontSize: width * 0.02,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 1,
              margin: EdgeInsets.all(width * 0.01),
              color: customDarkBlueColor),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: width * 0.04),
              children: [
                Text(
                  "- Python, Image Processing",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Java",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Unity Game Development",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: Get.width * 0.015,
                  ),
                ),
                Text(
                  "- Azure",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: Get.width * 0.015,
                  ),
                ),
                Text(
                  "- Scrum",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: Get.width * 0.015,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  getWeb() {
    var width = context.width;
    var height = context.height;
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(width * 0.01),
      decoration:
          BoxDecoration(color: Color.fromRGBO(125, 125, 165, 0.8), boxShadow: [
        BoxShadow(
          color: customBlackColor.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: width * 0.01),
            child: Text(
              "WEB",
              style: TextStyle(
                  color: customDarkBlueColor,
                  fontSize: width * 0.02,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 1,
              margin: EdgeInsets.all(width * 0.01),
              color: customDarkBlueColor),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: width * 0.04),
              children: [
                Text(
                  "- HTML, CSS, JavaScript",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Bootstrap,",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- PHP",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- C#",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- ASP.NET",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- MVC",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- MSSQL",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  getMobil() {
    var width = context.width;
    var height = context.height;
    return Expanded(
        child: Container(
      decoration:
          BoxDecoration(color: Color.fromRGBO(125, 125, 165, 0.8), boxShadow: [
        BoxShadow(
          color: customBlackColor.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      margin: EdgeInsets.all(width * 0.01),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: width * 0.01),
            child: Text(
              "MOBIL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.02,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 1,
              margin: EdgeInsets.all(width * 0.01),
              color: customDarkBlueColor),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: width * 0.04),
              children: [
                Text(
                  "- Flutter, Dart",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- React Native",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Kotlin",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Swift",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Rest API integration",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- Web socket",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- App distribution on App store \n  and Google Play Store",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
                Text(
                  "- SQFLite",
                  style: TextStyle(
                    color: customDarkBlueColor,
                    fontSize: width * 0.015,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
