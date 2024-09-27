import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class HotCategoriesView extends StatefulWidget {
  const HotCategoriesView({super.key});

  @override
  HotCategoriesViewState createState() => HotCategoriesViewState();
}

class HotCategoriesViewState extends State<HotCategoriesView> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 160.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container(
              width: Get.width,
              height: 160.h,
              margin: EdgeInsets.only(right: 6.w),
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: theme.redColor
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset("assets/images/products/product_3.jpg", fit: BoxFit.cover,),
              ),
            )),
            Expanded(child: Container(
              width: Get.width,
              height: 160.h,
              margin: EdgeInsets.only(left: 6.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        color: theme.yellowColor
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset("assets/images/products/product_4.jpg", fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    width: Get.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        color: theme.buttonColor
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset("assets/images/banners/sm_banner2.png", fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    width: Get.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        color: theme.blackColor
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset("assets/images/banners/sm_banner1.png", fit: BoxFit.cover,),
                  ),
                ],
              ),
            )),
          ],
        ),
      );
    });
  }

}