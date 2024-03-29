import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:personal_web_app/constants/colors.dart';
import 'package:personal_web_app/extension.dart';
import 'package:personal_web_app/responsive.dart';
import 'package:personal_web_app/screens/other/education_screen.dart';
import 'package:personal_web_app/screens/other/experience_screen.dart';
import 'package:personal_web_app/screens/other/personal_info_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../other/professional_skills_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<bool> onHower = [false, false, false, false, false];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final List<Widget> screens = [
    const PersonalInfoScreen(),
    const EducationScreen(),
    const ProfessionalSkillsScreen(),
    const ExperiencesScreen(),
    Container(
      height: Get.height,
      width: Get.width,
      child: const Center(
        child: Text("Coming soon"),
      ),
    )
  ];

  List<Color> nawBarColorList = [
    landscapeColor1,
    landscapeColor2,
    landscapeColor3,
    landscapeColor4,
    landscapeColor5
  ];

  List<String> nawBarTextList = [
    "Personal Info",
    "Education",
    "What I Know",
    "Working Experince",
    "Projects"
  ];

  int currenntScrollIndex = 0;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  jumpTo(index) {
    itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }

  Widget buildBody(context) {
    return Stack(
      children: [
        Responsive(
          mobile: Container(),
          tablet: Container(
            color: Colors.red,
          ),
          desktop: desktopView(context),
        ),
      ],
    );
  }

  Widget desktopView(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Stack(
      children: [
        ScrollablePositionedList.builder(
            //TODO burdaki sayıyı getx kullanarak otomatik olarak al
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            scrollDirection: Axis.vertical,
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, scrollIndex) {
              return screens[scrollIndex];
            }),
        Container(
            height: height,
            width: width,
            margin: EdgeInsets.only(top: width * 0.02, right: width * 0.03),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.language_outlined, size: width * 0.03),
                onPressed: null,
              ),
            )),
        // Container(
        //     height: Get.height,
        //     width: Get.width,
        //     margin: EdgeInsets.only(
        //       bottom: Get.width * 0.04,
        //     ),
        //     child: Align(
        //       alignment: Alignment.centerLeft,
        //       child: Container(
        //         height: Get.height * 0.6,
        //         decoration: BoxDecoration(
        //           color: customBlackColor.withOpacity(0.3),
        //           borderRadius: BorderRadius.only(
        //             bottomRight: Radius.circular(20),
        //             topRight: Radius.circular(20),
        //           ),
        //         ),
        //         child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: List.generate(5, (index) {
        //               return Container(
        //                 margin: EdgeInsets.all(10),
        //                 child: InkWell(
        //                     onTap: () {
        //                       setState(() {
        //                         print(index);
        //                         currenntScrollIndex = index;
        //                         jumpTo(index);
        //                       });
        //                     },
        //                     onHover: (oh) {
        //                       if (oh) {
        //                         setState(() {
        //                           onHower[index] = true;
        //                         });
        //                       } else {
        //                         setState(() {
        //                           onHower[index] = false;
        //                         });
        //                       }
        //                     },
        //                     child: Container(
        //                       width: Get.width * 0.08,
        //                       height: Get.height * 0.05,
        //                       alignment: Alignment.center,
        //                       //color: nawBarColorList[index],
        //                       child: Text(nawBarTextList[index],
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                               color: onHower[index] ||
        //                                       currenntScrollIndex == index
        //                                   ? customLightYellowColor
        //                                       .withOpacity(1)
        //                                   : customLightYellowColor
        //                                       .withOpacity(0.3),
        //                               fontSize: Get.height * 0.02,
        //                               fontWeight: FontWeight.bold)),
        //                     )),
        //               );
        //             })),
        //       ),
        //     )),
        SizedBox(
          height: height,
          width: width,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage("assets/images/flutter_logo.png"),
                    height: height * 0.05,
                    width: width * 0.05,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
