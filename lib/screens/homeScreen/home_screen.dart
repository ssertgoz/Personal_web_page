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

  int currenntScrollIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
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
              alignment: Alignment.bottomCenter,
              child: Row(
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
                          decoration: BoxDecoration(
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Colors.black54,
                              //       offset: Offset(0, 0),
                              //       blurRadius: 15,
                              //       spreadRadius: 0.2)
                              // ],
                              gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.0),
                              Colors.white.withOpacity(
                                  onHower[index] || currenntScrollIndex == index
                                      ? 0.4
                                      : 0.2),
                              Colors.white.withOpacity(0.0),
                            ],
                            stops: const [
                              0.0,
                              0.5,
                              1,
                            ],
                          )),
                          child: Text("Page " + index.toString(),
                              style: TextStyle(
                                  color: onHower[index] ||
                                          currenntScrollIndex == index
                                      ? customWhiteColor.withOpacity(1)
                                      : customWhiteColor.withOpacity(0.3),
                                  fontSize: Get.height * 0.02,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    );
                  })),
            )),
      ],
    );
  }
}
