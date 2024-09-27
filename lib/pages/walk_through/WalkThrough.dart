import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'  hide CarouselController;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  WalkThroughState createState() => WalkThroughState();
}

class WalkThroughState extends State<WalkThrough> {
  //** Controllers
  ThemeController theme = Get.find();
  CarouselController carouselController = CarouselController();

  //** Utils
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();
  var selectedPage = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.cardColor,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: FlutterCarousel(
                options: CarouselOptions(
                  controller: carouselController,
                  onPageChanged: (page, reason) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  viewportFraction: 1,
                  height: Get.height,
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(
                     slideIndicatorOptions: SlideIndicatorOptions( indicatorBackgroundColor: theme.buttonColor.withOpacity(0.5),
                      currentIndicatorColor: theme.buttonColor)
                  ),
                ),
                items: ["1_illustration.png","2_illustration.png","3_illustration.png","4_illustration.png"].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                            width: Get.width,
                            height: Get.height,
                            decoration: BoxDecoration(
                                color: theme.cardColor
                            ),
                            child: Center(
                              child: Image.asset("assets/illustrations/$i")
                            )
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(selectedPage == 0 ? wtTextTitle1 : selectedPage == 1 ? wtTextTitle2 : selectedPage == 2 ? wtTextTitle3 : wtTextTitle4, textAlign: TextAlign.center, style: fontUtils.h5(theme.textColor),),
                    Text(selectedPage == 0 ? wtTextDesc1 : selectedPage == 1 ? wtTextDesc2 : selectedPage == 2 ? wtTextDesc3 : wtTextDesc4, textAlign: TextAlign.center, style: fontUtils.label(theme.grayColor),),
                    SizedBox(height: 20.h,),
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          utils.button(selectedPage == 3 ? theme.buttonColor : theme.primaryColor, selectedPage == 3 ? "Get Started".tr : "Next", theme.buttonTextColor, null, null, selectedPage == 3 ? TablerIcons.arrow_right : null, theme.buttonTextColor, () {
                            if(selectedPage == 3) {
                              Get.toNamed(authenticationRoute);
                            } else {
                              carouselController.nextPage();
                            }
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: 60,
            //   right: 10,
            //   child: SizedBox(
            //     width: Get.width,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       children: [
            //         SizedBox(
            //           width: 130.w,
            //           child: utils.button(theme.buttonColor, "Get Started".tr, theme.buttonTextColor, null, null, TablerIcons.arrow_right, theme.buttonTextColor, () {
            //             Get.toNamed(loginRoute);
            //           }),
            //         )
            //       ],
            //     ),
            //   )
            // )
            Positioned(
              top: 60,
              right: 10,
              child: SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo/logo.png', height: 24.h,)
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}