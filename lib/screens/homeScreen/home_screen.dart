import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:personal_web_app/constants/colors.dart';
import 'package:personal_web_app/extension.dart';
import 'package:personal_web_app/responsive.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> onHower = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
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
            itemScrollController: null,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: Get.height,
                width: Get.width,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                        height: Get.height,
                        width: Get.width,
                        color: customWhiteColor),
                    Opacity(
                      opacity: 1,
                      child: Container(
                          decoration: BoxDecoration(
                            color: customLightOrageColor,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/landscape.png")),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Get.width),
                              topRight: Radius.circular(Get.width),
                            ),
                          ),
                          child: null),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
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
                                      blurRadius: 25,
                                      spreadRadius: 0.2)
                                ],
                                image: const DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                        "assets/images/profile_pic.png"))),
                            height: Get.height * 0.5,
                            width: Get.height * 0.5,
                            child: null,
                          ),
                          Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.0),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.4),
                                Colors.white.withOpacity(0.0),
                              ],
                              stops: const [
                                0.0,
                                0.2,
                                0.8,
                                1,
                              ],
                            )),
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
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
                    return InkWell(
                      onTap: () {},
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
                        margin: EdgeInsets.all(10),
                        width: Get.width * 0.08,
                        height: Get.height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.0),
                            Colors.white
                                .withOpacity(onHower[index] ? 0.4 : 0.2),
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
                                color: onHower[index]
                                    ? customWhiteColor.withOpacity(1)
                                    : customWhiteColor.withOpacity(0.3),
                                fontSize: Get.height * 0.02,
                                fontWeight: FontWeight.bold)),
                      ),
                    );
                  })),
            )),
      ],
    );
  }
}
