
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double height;
   int page;
   Function ontap;
  FontUtils fontUtils = FontUtils();

  SectionHeaderDelegate(this.title,this.page , this.ontap,[this.height = 50]);

  var tabs = [
    {
      "name": "Fast Delivery",
      "icon": TablerIcons.truck_delivery
    },
    {
      "name": "Top Selling",
      "icon": TablerIcons.flame
    },
    {
      "name": "New Arrival",
      "icon": TablerIcons.playlist_add
    },
    {
      "name": "Discounted",
      "icon": TablerIcons.discount
    },
  ];

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return GetBuilder<ProductController>(
        id: "0",
        builder: (_productController) {
          return Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            height: 40.h,
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
                    for(var i=0; i< _productController.productCategoryList.length;i++)
                    // for(var i = 0; i < tabs.length; i++)
                    GestureDetector(
                      onTap: ()async{
                       
theme.updateSelectedIndex(i);
                        page=1;
                        ontap();
theme.updateWidget();
_productController.updateValOfCategory(_productController.productCategoryList[i].id.toString());
await _productController.getProducts(mounted: true,page: page,pageSize: 20);
                      },
                      child: Container(
                        width: 120.w,
                        height: 30.h,
                        margin: EdgeInsets.only(right: 12.w),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.buttonColor),
                          borderRadius: BorderRadius.circular(8.w),
                          color: i == theme.selectedIndex? theme.buttonColor : theme.transparentColor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon(tabs[i]["icon"] as IconData, size: 14.w, color: i == 0 ? theme.whiteColor : theme.buttonColor,),
                            SizedBox(width: 6.w,),
                            Expanded(child: Text("${_productController.productCategoryList[i].name}".tr, style: fontUtils.boldSmall(i == theme.selectedIndex ? theme.whiteColor : theme.buttonColor),))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
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