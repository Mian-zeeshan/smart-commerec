import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class PromotionalBanners extends StatefulWidget {
  const PromotionalBanners({super.key});

  @override
  PromotionalBannersState createState() => PromotionalBannersState();
}

class PromotionalBannersState extends State<PromotionalBanners> {
  CarouselController carouselController = CarouselController();
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return Container(
        width: Get.width,
        height: 230.h,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FlutterCarousel(
          options: CarouselOptions(
            controller: carouselController,
            onPageChanged: (page, reason) {

            },
            viewportFraction: 3/2,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayInterval: const Duration(seconds: 5),
            height: Get.height,
            showIndicator: true,
            autoPlay: true,
            slideIndicator: CircularSlideIndicator(
              slideIndicatorOptions: SlideIndicatorOptions(
    // indicatorBackgroundColor: theme.primaryColor.withOpacity(0.5),
    //             currentIndicatorColor: theme.primaryColor
              )

            
            ),
          ),
          items: ["bike-banner-scaled.jpg","banner-led.jpg","bike-banner-scaled.jpg","banner-led.jpg"].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container( clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        // color: theme.cardColor
                    ),
                    // foregroundDecoration: BoxDecoration(
                    //     color: theme.buttonColor.withOpacity(0.1)
                    // ),
                    child: Image.asset("assets/images/banners/$i", fit: BoxFit.contain,)
                );
              },
            );
          }).toList(),
        ),
      );
    });
  }

}