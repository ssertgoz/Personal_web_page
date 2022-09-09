// @dart=2.9
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_web_app/constants/experiencesJson.dart';
import 'dart:math' as math;
import '../../constants/colors.dart';

class ExperiencesScreen extends StatefulWidget {
  const ExperiencesScreen({Key key}) : super(key: key);

  @override
  State<ExperiencesScreen> createState() => _ExperiencesScreenState();
}

class _ExperiencesScreenState extends State<ExperiencesScreen>
    with TickerProviderStateMixin {
  bool animationFinished = false;
  bool showText = false;
  int _offset = 0;

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

  int currentIndex = 0;
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _offset = _scrollController.offset.toInt();

        var edge = 480;
        if (_offset >= 0 && _offset < edge) {
          currentIndex = 0;
          setState(() {});
        } else if (_offset >= edge && _offset < 2 * edge) {
          currentIndex = 1;
          setState(() {});
        } else if (_offset >= 2 * edge && _offset < 3 * edge) {
          currentIndex = 2;
          setState(() {});
        } else if (_offset >= 3 * edge && _offset < 4 * edge) {
          currentIndex = 3;
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return SizedBox(
      height: height * 2,
      width: width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(height: height, width: width, color: customWhiteColor),
          RotatedBox(
            quarterTurns: 2,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Container(
                  child: Container(
                height: height,
                width: width,
              )),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.1),
                  height: height * 0.1,
                  width: width * 0.35,
                  alignment: Alignment.center,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "EXPERIENCES",
                      style: TextStyle(
                          fontSize: 50,
                          color: customBlackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    height: 1,
                    width: width * 0.40,
                    margin: EdgeInsets.all(width * 0.02),
                    color: customBlackColor),
                SizedBox(
                  height: height * 0.8,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.37),
                    scrollDirection: Axis.horizontal,
                    itemCount: experiences.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      var fontSize = currentIndex == index
                          ? height * 0.025
                          : height * 0.015;
                      return Center(
                        child: Container(
                          width: height * 0.6,
                          margin: EdgeInsets.only(left: width * 0.1),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(250, 210, 183, 0.8),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            customBlackColor.withOpacity(0.2),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]),
                                margin: EdgeInsets.all(20),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: currentIndex == index
                                      ? height * 0.6
                                      : height * 0.4,
                                  height: currentIndex == index
                                      ? height * 0.8
                                      : height * 0.4,
                                  // color: Colors.red,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                            child: Image(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    experiences[index].image)),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Position    : " +
                                                      experiences[index]
                                                          .position,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: fontSize),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Type          : " +
                                                        experiences[index].type,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: fontSize)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Company : " +
                                                        experiences[index]
                                                            .companyName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: fontSize)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Duration   : " +
                                                        experiences[index]
                                                            .duration,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: fontSize)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Dates         : From " +
                                                        experiences[index]
                                                            .firstDate +
                                                        "to " +
                                                        experiences[index]
                                                            .lastDate,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: fontSize)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
