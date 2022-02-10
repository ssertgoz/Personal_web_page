// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;
  Animation _rowAnimation;
  AnimationController _rowAnimationController;
  bool animationFinished = false;
  bool showText = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween(begin: 5.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.ease, parent: _animationController));

    _rowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
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
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: Get.height,
      width: Get.width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
              height: Get.height, width: Get.width, color: customWhiteColor),
          Opacity(
            opacity: 1,
            child: Container(
                decoration: BoxDecoration(
                  color: customLightOrageColor,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/landscape.png")),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width),
                    topRight: Radius.circular(Get.width),
                  ),
                ),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: customBlackColor.withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Get.width),
                      topRight: Radius.circular(Get.width),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(Get.height * 0.05),
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
                            image: const DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                    "assets/images/profile_pic.png"))),
                        height: Get.height * 0.1 * _animation.value,
                        width: Get.height * 0.1 * _animation.value,
                        child: null,
                      ),
                      Container(
                        height: Get.height * 0.1,
                        width: Get.width * 0.3,
                        alignment: Alignment.center,
                        child: Text(
                          "Serdar Sertöz",
                          style: TextStyle(
                              color: customWhiteColor,
                              fontSize: Get.height * 0.09,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.3,
                        alignment: Alignment.center,
                        child: Text(
                          "Computer Engineer",
                          style: TextStyle(
                              color: customWhiteColor.withOpacity(0.6),
                              fontSize: Get.height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.07,
                        alignment: Alignment.center,
                        child: AnimatedBuilder(
                            animation: _rowAnimation,
                            builder: (context, child) {
                              return IconButton(
                                  iconSize: _rowAnimation.value,
                                  color: !animationFinished
                                      ? customWhiteColor
                                      : customBlackColor,
                                  alignment: Alignment.center,
                                  onPressed: () {
                                    if (!animationFinished) {
                                      _animationController.forward();
                                    } else {
                                      _animationController.reverse();
                                    }
                                  },
                                  icon: Icon(
                                    animationFinished
                                        ? Icons.arrow_downward_sharp
                                        : Icons.arrow_upward_sharp,
                                  ));
                            }),
                      ),
                      showText
                          ? Container(
                              height: Get.height * 0.3,
                              width: Get.width * 0.5,
                              margin: EdgeInsets.only(top: Get.height * 0.08),
                              padding: EdgeInsets.all(20),
                              // color: customBlackColor.withOpacity(0.5),
                              child: Text(
                                "In 2018, I started the Computer Engineering Department at Izmir Institute of Technology. I am now in the third grade and I have had the opportunity to develop software in various fields from robotic coding to image processing, from game production to mobile application construction. I'm developing myself in the fields mobile application, and I am actively working on mobile application development with Flutter.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: customWhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
