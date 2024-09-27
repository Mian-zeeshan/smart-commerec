import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class CouponBanners extends StatefulWidget {
  const CouponBanners({super.key});

  @override
  CouponBannersState createState() => CouponBannersState();
}

class CouponBannersState extends State<CouponBanners> {
  CarouselController carouselController = CarouselController();
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return Container(
        width: Get.width,
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w)
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: FlutterCarousel(
          options: CarouselOptions(
            controller: carouselController,
            onPageChanged: (page, reason) {

            },
            viewportFraction: 6/1,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayInterval: const Duration(seconds: 5),
            height: Get.height,
            showIndicator: true,
            autoPlay: true,
            slideIndicator: CircularSlideIndicator(
               slideIndicatorOptions: SlideIndicatorOptions( indicatorBackgroundColor: theme.primaryColor.withOpacity(0.5),
                currentIndicatorColor: theme.primaryColor)
            ),
          ),
          items: ["coupon_1.png","coupon_2.png","coupon_3.png"].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return AspectRatio(
                  aspectRatio: 6/1,
                  child: Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                          color: theme.cardColor
                      ),
                      foregroundDecoration: BoxDecoration(
                          color: theme.buttonColor.withOpacity(0.1)
                      ),
                      child: Image.asset("assets/images/banners/$i", fit: BoxFit.cover,)
                  ),
                );
              },
            );
          }).toList(),
        ),
      );
    });
  }

}