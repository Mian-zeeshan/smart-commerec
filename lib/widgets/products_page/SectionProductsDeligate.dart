
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class SectionProductsDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double height;
  FontUtils fontUtils = FontUtils();

  SectionProductsDelegate(this.title, [this.height = 50]);

  var tabs = [
    {
      "name": "Machines",
      "icon": TablerIcons.truck_delivery
    },
    {
      "name": "Refrigerators",
      "icon": TablerIcons.flame
    },
    {
      "name": "Microwave Oven",
      "icon": TablerIcons.playlist_add
    },
    {
      "name": "Air Coolers",
      "icon": TablerIcons.discount
    },
  ];

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        height: 35.h,
        decoration: BoxDecoration(
            color: theme.cardColor,
            boxShadow: [
              BoxShadow(
                  color: theme.textColor.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10
              )
            ]
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for(var i = 0; i < tabs.length; i++)
                  Container(
                    height: 25.h,
                    margin: EdgeInsets.only(right: 12.w),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: theme.buttonColor),
                        borderRadius: BorderRadius.circular(8.w),
                        color: i == 0 || i == 1 ? theme.buttonColor : theme.transparentColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if( i == 0 || i == 1) Icon(TablerIcons.check, color: theme.whiteColor, size: 14.w,),
                        if( i == 0 || i == 1) SizedBox(width: 4.w,),
                        Text("${tabs[i]["name"]}".tr, style: fontUtils.boldSmall(i == 0 || i == 1 ? theme.whiteColor : theme.buttonColor))
                      ],
                    )
                  )
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}