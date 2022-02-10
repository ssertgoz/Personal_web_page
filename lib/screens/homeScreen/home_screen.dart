import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:personal_web_app/constants/colors.dart';
import 'package:personal_web_app/extension.dart';
import 'package:personal_web_app/responsive.dart';
import 'package:personal_web_app/screens/other/personal_info_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> onHower = [false, false, false, false, false];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final List<Widget> screens = [
    const PersonalInfoScreen(),
    Container(
      height: Get.height,
      width: Get.width,
    ),
    Container(
      height: Get.height,
      width: Get.width,
    ),
    Container(
      height: Get.height,
      width: Get.width,
    ),
    Container(
      height: Get.height,
      width: Get.width,
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

  @override
  Widget build(BuildContext context) {
    itemPositionsListener.itemPositions.addListener(() {
      print("girdiiiiiiiiiiiii");
    });
    return Scaffold(
      body: buildBody(),
    );
  }

  jumpTo(index) {
    itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }

  Widget buildBody() {
    return Stack(
      children: [
        Responsive(
          mobile: Container(),
          tablet: Container(
            color: Colors.red,
          ),
          desktop: desktopView(),
        ),
      ],
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        ScrollablePositionedList.builder(
            //TODO burdaki sayıyı getx kullanarak otomatik olarak al
            itemScrollController: itemScrollController,
            scrollDirection: Axis.vertical,
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, scrollIndex) {
              return screens[scrollIndex];
            }),
        Container(
            height: Get.height,
            width: Get.width,
            margin:
                EdgeInsets.only(top: Get.width * 0.02, right: Get.width * 0.03),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.language_outlined, size: Get.width * 0.03),
                onPressed: null,
              ),
            )),
        Container(
            height: Get.height,
            width: Get.width,
            margin: EdgeInsets.only(
              bottom: Get.width * 0.04,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: Get.height * 0.6,
                decoration: BoxDecoration(
                  color: customBlackColor.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                currenntScrollIndex = index;
                                jumpTo(index);
                              });
                            },
                            onHover: (oh) {
                              if (oh) {
                                setState(() {
                                  onHower[index] = true;
                                });
                              } else {
                                setState(() {
                                  onHower[index] = false;
                                });
                              }
                            },
                            child: Container(
                              width: Get.width * 0.08,
                              height: Get.height * 0.05,
                              alignment: Alignment.center,
                              //color: nawBarColorList[index],
                              child: Text(nawBarTextList[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: onHower[index] ||
                                              currenntScrollIndex == index
                                          ? customLightYellowColor
                                              .withOpacity(1)
                                          : customLightYellowColor
                                              .withOpacity(0.3),
                                      fontSize: Get.height * 0.02,
                                      fontWeight: FontWeight.bold)),
                            )),
                      );
                    })),
              ),
            )),
        Container(
          height: Get.height,
          width: Get.width,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(Get.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage("assets/images/flutter_logo.png"),
                    height: Get.height * 0.05,
                    width: Get.width * 0.05,
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
