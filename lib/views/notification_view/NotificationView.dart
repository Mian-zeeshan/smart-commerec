import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});
  @override
  NotificationViewState createState() => NotificationViewState();
}

class NotificationViewState extends State<NotificationView> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0",builder: (theme) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: theme.primaryColor,
          ),
        ),
        body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            color: theme.cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: theme.primaryColor.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 12
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                      }, icon: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(TablerIcons.arrow_left, size: 18.w, color: theme.whiteColor,),
                          SizedBox(width: 12.w,),
                          Text("Notifications".tr, style: fontUtils.h6Bold(theme.whiteColor),)
                        ],
                      )),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: (){},
                          icon:Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Read All".tr, style: fontUtils.boldLabel(theme.whiteColor),),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Expanded(child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h,),
                      for(var i = 0; i < 10; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(8.w),
                                color: theme.cardColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 33.h,
                                    height: 33.h,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 30.h,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.w),
                                              color: theme.backgroundColor.withOpacity(0.6)
                                          ),
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          child: Icon(TablerIcons.bell, size: 18.w, color: theme.textColor,),
                                        ),
                                        Positioned(
                                          right: 0,
                                            top: 0,
                                            child: Container(
                                              width: 8.w,
                                              height: 8.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: theme.redColor
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Expanded(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Order is dispatched".tr, style: fontUtils.boldLabel(theme.textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                      Text("Your order has been dispatched to our warehouse and will delivered to you soon.".tr, style: fontUtils.small(theme.textColor.withOpacity(0.6))),
                                      SizedBox(height: 3.h,),
                                      Text("yesterday".tr, style: fontUtils.small(theme.primaryColor.withOpacity(0.7)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                    ],
                                  )),
                                  SizedBox(width: 6.w,),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width,
                              height: 1,
                              color: theme.textColor.withOpacity(0.2),
                            )
                          ],
                        )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      );
    });
  }

}